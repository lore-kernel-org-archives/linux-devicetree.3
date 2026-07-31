Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B6A437849
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509129; cv=none; b=aEjU0jfjZbmZO8m/nqizznQCTnqU6BMqFAwA3n5J0SgcX7FmdkJBQNjD1ZAU6kgJYrWlENZ1kWbE/Ol349VyP8bcSFlkT7IILcE2+7AyrqivDqiNBJlTIU7u5tH1HqMVMBVtWOVUJv0S4MtR5sPeKdwt1wj+7q3cb7YcQUZiYD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509129; c=relaxed/simple;
	bh=E7eJRBrZC7S6Dyl1yr3XZTSVgHOfz9ZEHGWqdMcDUsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJXM7dEz1peCAPQb/JE5SpLt08p5ONqxAh5ckGPyPjKtyfkh72+7TYIa78Plvl2zxu/ZsTGnilo5oCtV5ohWrm2sqjtj/mJiYjg3Y3w51k1uAqMVowjS18S7P1vvZdeCzqsYBrH10SXoJ6vBL2ms06vXpgEyiYLl2mJSB678FC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PblENfWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPvSeWTM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PblENfWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPvSeWTM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCGnwe3978367
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUUexB7yi2dILgMSCy1Iht2kViTXKPk+CZkKSkRmhf4=; b=PblENfWdzolEPPKm
	NaHHVyHcnaaL+p03zGEnFLe20xztcSUywPvQ4QREHQIpXrFcWi9WpxKEK6POmr3x
	qjGDS5VZ6sp8H0STHBjH6eq8opc4Bgu/7TMkzSHzVifE6kG2vC26ve+iSJzf9LMC
	vGTRg8Pb/u95/J6O9l/Tp6Z2wqOVP4uxLssuhqWdziyAqoreqm2zkj0l032aT71M
	pJiLwwkyNvjPij0jr1SN5qhsaOxHbsclWkB/aP6gSH3JNrjeVM3Wt+INcZy8ic/b
	IJ3R+dqIprDJInKKskGfTjKwUsJiqZPaMgAHDgTJr/1SmWMZiYVqVezTbnSX2qzy
	bKjF1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujurp2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:45:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so9558181cf.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785509127; x=1786113927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUUexB7yi2dILgMSCy1Iht2kViTXKPk+CZkKSkRmhf4=;
        b=GPvSeWTMQ0KWHO63xo0wW0bl9MYw/xGTj9WqfFnWTmSz/vlLfWUo+H2RLfN6jzKlN5
         Gj271glYLGyeCG2ZGGv38U6V2nHvp/ecDZp4nB2c/ehZOf6odwwkP2gpi9D0gk8MnOMm
         GUKk74H0PewPaOf8CXxUqn7ewq+W55bU2xtT8+fYNsVfFsyRhfYvmhIyEDpimUViAPac
         diLeOTY2O/RmfhSCDRicBeoeWSYsXXaIlrNEzzdzm6dKha6BKHNMNntDqhlMvzxLO+aY
         XYBRK6RI5xCMSuy5ghRAsHG7k5nE+SyzjoNUWmLDEupv0XOLDAqyB1B2VzaETqeSfrcy
         PLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509127; x=1786113927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUUexB7yi2dILgMSCy1Iht2kViTXKPk+CZkKSkRmhf4=;
        b=a7G3LOj2J1Vy2K5B5fM/zkGxw/0AgkXT6pFdPcCCpbjkB93oGUQcfubRTtqaeEH4QP
         NFMDs7piCWapmSXSr463ikxxLTz1GZKdL3W51SbPoIZoFgVblTxzrVQuyA9Eu+F/juej
         KU6odFk/NwLIuYTwm7gF7J1JbOJrCigWA+euVPdSi7gf7GDVe+5Vys7ZvQKAFkmlBvQh
         Yv7B9K8hzYP80KMBLAJrPLcpuWC9D+G6Uy0bxjIR7I2Qn7FhTV8f3F7LZqspIZP6sUm7
         5QjxOp0UIIgcCmktUFfSMMTtC4xtXjY7KD/fs8xlWYR/X+BXgzCT1CalUvBTcev/0gDE
         ZwKA==
X-Forwarded-Encrypted: i=1; AHgh+RqqZj9QQcq5CYcfRCU8DDmoAzbdlrbnBjDlsgSgDlG/x/CeR3dr/o3F3ZGJ1DBrbKyK+odvdkCQc/7a@vger.kernel.org
X-Gm-Message-State: AOJu0YwMaYl6VrJKT98qDWXVvWkHzoyhd1a9C7ziit7SJjjbTqSdt1Ia
	VEojS7xE8SCyUCstH7AHoICAUEDlNNl+khRBGl4etovOLcn1JfOPCYYo0oAk4bfE+HFSrEukzJM
	filVj2McBJlFeFmGCtlR6xuH0tQ+BapknpzfaBZgT+81UnfvlBk7E8/b7mmncgjfu
X-Gm-Gg: AR+sD11ka+0LNCCxx5V5cdM7CAxgUgDyRAk/YLMkvbhOpqtvIr8DzgGyyRMmOeWMDJd
	6YBkro5uVTUzKtqzjMpZmRWGK4lCi3VUgzLJXgyurcIorbGP7ZcTJnp1E/iuOOyAu8AGKVf3wy0
	4ExlgFFuKUd7670bmlfZMybCNVJHsagHzsdK6OT/e6vUrqUmJELOgkIG0Ka0LtAKusTLH6+p/jo
	lrHeRejU//ps3XKiPQPHDmHQbtt2/jsJTQ7FFsuccDtzOgk/IDiShxxy/sJlvUJSxpvDO5HwwAO
	BMyC3b/rAZVo+9hkR8NSSTFGpmAz0Itc8xPtxx7bWVeYCU2Xq+PkNUY4qO5wD6EFCJ558iDCud8
	3kIB4HmKFl9amAB1XTFxsEfVHUca1TqLv
X-Received: by 2002:a05:622a:c84:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52b5682e980mr7805841cf.26.1785509125565;
        Fri, 31 Jul 2026 07:45:25 -0700 (PDT)
X-Received: by 2002:a05:622a:c84:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52b5682e980mr7801041cf.26.1785509123372;
        Fri, 31 Jul 2026 07:45:23 -0700 (PDT)
Received: from [192.168.1.10] ([122.177.247.168])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e24564d3sm353641e87.71.2026.07.31.07.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:45:22 -0700 (PDT)
Message-ID: <712f8a14-d2a1-4a90-82f9-05cd694f2658@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 20:15:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: bluetooth: qca: add QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-1-2d100f30e202@oss.qualcomm.com>
 <20260731-first-righteous-bear-dd72ed@quoll>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <20260731-first-righteous-bear-dd72ed@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6cb507 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wVA5pQU3D6HtJETKl3oCcQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZtkR8tRNVxI1tjOBf7kA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cU6gZoALqVzhOxLGmL6vzW-0Q-jkBAZ4
X-Proofpoint-GUID: cU6gZoALqVzhOxLGmL6vzW-0Q-jkBAZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX/aCe86UR48Az
 J8yd/V9MiYm02T5WvNPyC3o95N+V3JN6QqICEqUA7Q/7NU3Vbjz/ArfrU0Ah44ANf4rqAqb59/I
 M/u3G2aICl4QC36DSkvMNv+FKLpvjK5wN7xdrkmFhVLvohvyQ/oV9exX8CRiD1sU8zFUFO46f77
 ztgdlraeV2Ifrb6g8cd1YXxrCAJx4EqVyQQQOKdgXlLP44ZcLeOI74bbdxaXpvyRi3WpD03iXj+
 /qg4slmNz53kiBxmr+dsbQ0ChabNIAs2l9JUEx2UpzpuUMSQd7ZSzoYluK5I3p9apOU7R4HRsg2
 mZJdPkVyaZTwRZo0SkTVKddIIKoEYxXA5dVZnxR/sgfywLO8intohsr8eRaB6RS9ErH6++F6qVt
 YvS9djGosFlwKPVD1isTIH1FCOUSVztVyNxsi/Hqdi5Xj0VyXgPPgGaXf3ANGtdm5shLV3SrhFu
 RpdSaaRYCGez2aF0wqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXztF2XnpCxKw2
 o7efptTJcI1/7jAwXLiICEzSMVkZhk1Ex4dODV37Cb1ukSGm0gm4rD8jRupuNjz1pv/mJHmGsby
 d6VCZB4PaYV8t5zXUfsF+NJIcuoLKpU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112



On 31-07-2026 15:16, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 09:15:01PM +0530, Rahul Samana wrote:
>> QCC2072 can be used on M.2 E-key cards where the card power resources are
>> described by the pcie-m2-e-connector node. In that setup, the M.2 power
>> sequencing provider creates the Bluetooth serdev child after matching the
>> QCC2072 PCI function.
>>
>> Integrated non-M.2 designs need board-specific power resources. Document
>> only the compatible for now and leave those properties to be added with
>> matching driver support.
>>
>> Document the qcom,qcc2072-bt compatible used for QCC2072 Bluetooth
>> controllers connected over UART.
>>
>> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> 
> NAK, exactly same comments as before.
> 
> Nothing got improved, although what is weird - original SoB is gone, so
> this is legally dubious work.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thanks for the review.

For the binding contents, I tried to capture the current scope in the binding
description itself. This series supports QCC2072 only as an M.2 E-key card,
where the card power resources are described by the pcie-m2-e-connector node
and the M.2 pwrseq provider creates the Bluetooth serdev child.

The binding also says:

  Integrated non-M.2 designs require board-specific power resources. Those
  properties, together with a static devicetree example, should be added when
  integrated non-M.2 support is added.

We do not currently have an integrated non-M.2 QCC2072 design, so I do not
have board-specific regulator supplies to document for that topology.

Could you please suggest how you would prefer this binding to be handled for
the current M.2-only use case? 

For the authorship concern, I mentioned the earlier QCC2072 contributions in
the cover letter, but I understand that is not sufficient. Since this still
documents the same qcom,qcc2072-bt compatible introduced by the earlier
work, I will carry the earlier authorship / Signed-off-by chain in v3.

Regards,
Rahul

