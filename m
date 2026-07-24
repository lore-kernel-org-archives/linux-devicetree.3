Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2523B9922
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880141; cv=none; b=mesntqvnsmrTh9L49FQJ28t0rD0gsciuI4+1JmUrzI5ZmHWdkLh91RG+2Myh5j0QUfqajGhYzK5rr2yv7R5pCidmJmJJ3t3hiqEdVOYAGJvSF6XVuN0DFAehhldMo5+1Tn14dRw2raVIuJyQpCaHGHz5QSZVhB57XalQ3Cy/KYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880141; c=relaxed/simple;
	bh=eU1HJeg93SSr/oTa8pUhai6mKfyTGLRRMjqX6oMMAXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X17RO5sZnU7zf3jXXGOJkYS6CtxpjdhiwtvAx9c1H4a22EK60AoGKafC0HX8yY5f03coF/j1o5FINJP/n+lKdNX3j0EXIPqY08DlPubDWwsAjQxgHw8mFvF3GvyWpNDEFvoE/O16p9dFggbivQS8TsWZtqj8CPDodkl8HlWzKTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DV7y2KOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Il65q+C9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DV7y2KOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Il65q+C9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lKdB2137634
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHaQAyJrwMTgyLoUAt+XD1qDXwZG4W1qzyvi7HKMkZQ=; b=DV7y2KOqjSEhUawT
	v4IA1OmOmSYhH3VsuvRF5Hmw/o7KXKzN+HWk/aDuj8wVGokQyZ3PqNWlhitQa/j1
	Sg+KoJ/pJxlBBBl27GSEd0NZKuROF8P3N2B7onVkQaagLyd5PZ2qI2w023qQfZpU
	BOhbeJywI2OTyKyIuD/wVgvv2rLb6ikLkLQrRf2rxGsuTbHxkYqbKspIw1ckvjqh
	MnR8F8VRy/826nYXxIkZTUdPlao9lxeG/wMSzXOYeW3LPlq2eu7Cl58WaM2G+Z/n
	WtAwTN2C6kX8jk8iG3PzcHklp+e45OeS63oSzhgjsl8T2vGdwn8O+8svtZ51Eqn3
	IwniDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1asvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:02:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so3597815ad.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880139; x=1785484939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHaQAyJrwMTgyLoUAt+XD1qDXwZG4W1qzyvi7HKMkZQ=;
        b=Il65q+C977HQxgsQtjTfIQlzHIaEFJu6cLX3dbk/3N+IixWTvEQCdO2UMBLuPz42S0
         /Qn5CQoOziPIMApegE0JY5VNTKMimsiI4rsS6t05ltr/+Num0cHQKo7kokt5A8r60N6X
         3bhyX1ZqNzVXxW5KPuVsspXGuMnTtX1obmsEhCURCnMKQiR4ijmXV1Y33JRo/y2cHf5u
         8e0D5lM5xIm1p3rfefsoS2A5fhe47bres3m/U70qUVxfdPRKNfqQr5XaoYUGya2dgSyW
         W/reVGWj+4x/TqNg3uhYYu0v6baeliKBD3mnWkLu9T+vLdx/I3OVPOfAw4dcZXyfQtQD
         zRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880139; x=1785484939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHaQAyJrwMTgyLoUAt+XD1qDXwZG4W1qzyvi7HKMkZQ=;
        b=elF16uROAvQexZITrDXK2OnuUlVTcavdOkG3wVCqfQoSIYqaBFeVX58A0jh5QwTrjq
         MfF28tVNJ5nk+KDbdUOOY3T6E16/3eIyQfTBgIYbl1n2314F8BdRyQK/8PTqCZ8Awie+
         6NvsGFJuVGW+bKRbM37YG9mOCoWAlr/r3iD4fm5HEwvnA/Cw3awReCEQ8MVMlFaSDt2A
         Qtcnkx0MDzxzjbadP/Ohr7PfB7PygH/UcFtzckAihKv+2jHqaOFZxL1X/YC5Z6bpVf5b
         NbJTf4gqdWspBZYlhbTo7/cSACqr3I3sC5kiaa6xMmguqyWog+9Kx1EXctF21M5mo+Ab
         uTlA==
X-Forwarded-Encrypted: i=1; AHgh+RpohO8aFWocFWhXs6ALDnCqozZgwxfVsJn0l73TyceCfrLY3wHiqBTAvl7ccQaB6Sux6/l5xO+3nNAa@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyGUd45zJCsAg3Vhb4HtsRCFnndVaHhm1V/mr8ArYfXIh3X2e
	PpwFENcyGRsx1SrqGkZB6M965DdVPWMzoamCgBJYNE8uEEdQbzKmlUjzYGAbFE+OPPtvcUUfkPy
	CDgbdSTgKUPSQtgQ7V5HNVKsV5Ce2+UyKCvCjjobrOPwWM+bnKF/SjXmMcJehPOZH
X-Gm-Gg: AR+sD12bKrZsT+wP+fFQxX6w4yY/6LB9tOdea5dyieXHeIAAzRw91iNbKXkvaNW+EOr
	o4aNZDjxg99DHXlPzUG+xf615ufY+LlzPxHsoORaFprcwbPXMlGYWRcXlJnU8QRqL2XMOmZwsaC
	ojaDyD2usJ7oQV8hKmzSoIPTHC8n/Ux3C+y/c6JjZ6ixVkgD5EJpEi8gPUHB5ZhIaAegydW9810
	pmuIc3uJ+G50t1CWduBZ62DRzD/5SrSCGWaYZ6kQnfvemosCI9AYrHrSrCQsGqJFHWw6/cGP813
	zpLzbsVl6zGws+qpQ5z/OykrtygGU4NEpt0Ou3+0TvpY1NACYKWqGoujYuYiTH06WCwWB2YKgoS
	9hfEportq7HYemOe2VYOOclONeltXeh0=
X-Received: by 2002:a17:902:ce05:b0:2ca:ef16:8e8 with SMTP id d9443c01a7336-2cfa708d1f0mr73509225ad.29.1784880139132;
        Fri, 24 Jul 2026 01:02:19 -0700 (PDT)
X-Received: by 2002:a17:902:ce05:b0:2ca:ef16:8e8 with SMTP id d9443c01a7336-2cfa708d1f0mr73509025ad.29.1784880138738;
        Fri, 24 Jul 2026 01:02:18 -0700 (PDT)
Received: from [10.217.252.136] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm46566895ad.33.2026.07.24.01.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:02:18 -0700 (PDT)
Message-ID: <7bc5d5cb-7f35-4eee-9e3a-695fcd39db6b@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:32:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
 <6a30c443-ed57-4443-aa34-f6bbe5049370@kernel.org>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <6a30c443-ed57-4443-aa34-f6bbe5049370@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1SHGjDlR3gnVClyBvjySpJT5N2RgmDXo
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a631c0b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vWUw25gFCHY1kBUJboQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MiBTYWx0ZWRfX8tIdx6FAniDL
 3xK8tX17c3gKDH/pShxIPPjDhQsOrfijV1MIlZxRcqLKfeGB6cTUgVaEmWuxm3k22oubwtx03cu
 UIAMcm5ZRCZTunwpdEZ2gyY/m1DkkWSDNG4PqD9De+Mc0wLJHkWDF/w1ynvJmRPgBfSibyC5ijX
 bBZIaWh/R2PfWMmY7zBX8yIL2TGPBj5DhC3W2mi+y5uK0EE8qpBwW5zX+yz7QMiXY/fCWxO5GXD
 5OnIUvEjiKuir3dzsIlncinYKlvnFCtc4t4X+mtW/0JO+wQTVsPgVnq7lhL5SsQk9DULpGuVnhO
 gSZnGkTp8zSwt1mLwbnCM0GajzY6kbeS10N1yWh+GPa/hVH91F4XLKXC4sFr/SfTAdQR9vxFcNQ
 U8XXiaf5jdPTM75E8Liy4Lf8ObHqEDbUG4y6BRZr2XuRKAvGrLYfhe7Kqaw8yUFmDTWraDVeF0U
 2Y4ZRFOSNRyw2L3p4Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MiBTYWx0ZWRfX7YKmWwPzFGPO
 Et4gVmYFWUZuzGDV6SjinKhpXMKeRsr/v7NRGGF3hsO8ZWyDecm603hdT0WCOn/62Nm/8OlYcHj
 IC38CXDlMA7euUmLcMKnNwv3Il/95C8=
X-Proofpoint-GUID: 1SHGjDlR3gnVClyBvjySpJT5N2RgmDXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240072



On 24-07-2026 01:01, Krzysztof Kozlowski wrote:
> On 23/07/2026 14:31, Rahul Samana wrote:
>> Add the PCI class compatible to pcie0_port so child nodes below the PCI
>> bridge can be matched against the enumerated PCI topology.
>>
>> This is needed by the M.2 E-key graph description used by the RB3 Gen 2
>> Industrial mezzanine Bluetooth UART overlay.
> 
> NAK, there is no such overlay.
> 
> Best regards,
> Krzysztof

Hi Dmitry, Krzysztof,

Ack, I will rework this patch in v2.

For the commit message, I will explain the reason first and then describe
the actual change.

For the overlay reference, I was referring to patch 3 in this same series,
but I agree the commit message should not justify the SoC dtsi change by
referring to a board overlay. I will make this patch stand on its own by
explaining that compatible = "pciclass,0604" is needed on the pcie0_port
node in kodiak.dtsi to allow the PCI subsystem to associate the DT node
with the PCI-to-PCI bridge device.

Thanks,
Rahul

