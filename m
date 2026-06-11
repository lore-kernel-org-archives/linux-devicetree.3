Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ADD3D5226
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179453; cv=none; b=b5S7e08KeUchCX42sK/VRrcBBWNgbU6uWpDaUWpnX8ftq6uO3R51qv2DAXoezQ/4AKjID64evgXhlN6d8taQFALqwmD2BsgwYVKo8JiZwdnkpUZHHMmiFwWt6oBURn8acyQujz7n6heRJIYpdDgqceieyOpFGrA77uPFTNx0YkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179453; c=relaxed/simple;
	bh=w+y1X+ZNiJg65rSDstMld5R8KxYOqoox95WB44xxs3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEJFsjTf5r0nI9WGKm0qqLnVvX4mTKZm1fr5+H+nUdr6F1PxiTS7BPPaAbrmHarVjRowyimAxKo17uWGpbVwlSXWlFcO897qR3/1W7fVwg5Mh2wVNK0Dz67yweSpkYf+AIvhxeka7U/4fTyFzTGpyjiBDpQPB7XWascIwdg73BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGtw19oG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keNQ82Ib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGtw19oG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keNQ82Ib"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xSWc174172
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0RiQNzKW417vkjMQkmym11eTxmsfGp45AkrTPKlifY=; b=BGtw19oGKNB/HWnP
	yq/EmwUlaOsudKOSR02wTI4jjuMRQpJuFqB5jrtIyovdYrbVvtM0pNx23k1IaYuX
	D7vuzLzmjgiucyVEgcWOZB2OlDDpZVx+Rb9zA6+VN0NXCCotSgsH8DWQXYx8aNs8
	w6IpmV0jmKN2o8KuGoGxdPlqUODpQ48JzDvCKnvRz06q8WrAYtkm0E8HzToWUY56
	RwegB9KBvinRANH/I2WlEfrrHPK/PGTf5qmd09XNchyRB0HH8nk1bi5ig7enKoyb
	S1CMe4Pq6Lo3iFZqhKED/eI/pyE8NgVtSGRGEzm3CtjyXnShmG5dx3/wDnG7ribp
	B0QCpA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb74d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:04:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so324655137.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179450; x=1781784250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0RiQNzKW417vkjMQkmym11eTxmsfGp45AkrTPKlifY=;
        b=keNQ82IbYioI/w7JjixnBHIeW39mQUVQuniWrTxN28c/S+a3wOnCjijgACbNNh3xMc
         Ydu+Ke7DLyLnXIc+EksfGDsEM3qhI4+/pohH93jUSYyKPaVRv5gnJbSjscwiHtoZTc0c
         AN8RXY4JhzLVgaWhqLaiNTuWOANZPrMHv4TGmLo9ZlLHwjKzQAsDjoU8LepQ8NyB5A7N
         HsA+VqKjcEUNE5YfLqFgychHHiYLzY+C6Ct+5P/ALk7tTXLLTvnnX3kkXkjapTgN8vTd
         HV/m5utHuJ6zUQU39Tms7vMlXh7hmq+Z4uf000oNB0viw9OsVD54wzOog0MveyPgqQmR
         ysDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179450; x=1781784250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0RiQNzKW417vkjMQkmym11eTxmsfGp45AkrTPKlifY=;
        b=cxXjiI23VFQGRsaZKnPFEQEmZCVNYdOfF+uEBYP+6rnp3TFJvgLfSuvxrsLVBYEpDs
         aYSBix9+LgN7+o8NJPgOLPlGbulQ2dC2SUuhj4jeSGZCfYTd4XUYdD80aC3I3SCxSqFo
         2x5kyzufnydJAy3fLonXdylzPJqwNcGXWfaH71mu10b0cTy0D0A/7cr3rairKnM4ZfvI
         53P/TM6tU/Gkpk4vG19B+OtqhKOcISiDiEeVWO9615AO2fvyMG2RwixvDLiasXRJfATw
         SFgdV35Q5AOq87PXS10sXF89pSp18H9bDQnc8+b3eStQO0V+9+nCf+84eYy7pYucCt9X
         XxwA==
X-Forwarded-Encrypted: i=1; AFNElJ8LzNw7wNEwrG1GCw3hRYOMRtBr3e0fzkYF+drPt+CjnouYqa4gvviddvm9S00ztLxpXR6dWuaqTVD6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6GmOFCli1hFcE2UV9CBzH4Oj9mY0aC/B6i92d1n3fkVJ3o7k2
	F75UbyMaxw5XQtyBgDByYum9mESE/EOywz5XExk5r7M5pLLE3/JFKHsx6GQDXsMBv+tGwLdCBgU
	nZd9aFiJ4/XR+HKEoSl6xG3Gs7iABRJgnPGrFGe7wedIYhh+QBevv6UABGVqqKt07
X-Gm-Gg: Acq92OFW8IP6jiNkmhDOWRt9Aobt/nYU7hu/rJaG7kVQlyBe3GPF6FzcRz7ewNykpWi
	0AKitSb5ORwdKc8XtV/tkBXa0QGWcTHQAy7nNjqudwknRA+D1DB5oXEWXa0V/podxtBoqI2BDxo
	yu1bDrKBZ/O5bmD5lyzQT6xhYLQ3sF/Oh1+rilD+qBp+J3rZPXRrEoOcy3MpTNJfWod1lquPBNS
	VPtYA5KV8ZaDyNJWmI1KbDC6xWyrDDfVx97KU0VGUSZP9vUs/9m2UwaX7tdGjSb1nfHVrvS4sRR
	l1wcBw6ZV1kHKL64Lwk9zJmYtTh5fC35W06QRYt13pYmxRC3J6pia22ln4Aps5sB4p1rkyVJ37b
	J791d/yOu7Semp7/A1QhJWvJH3hNlkPXd4EqsBTlHtoUERNzcoDlhe9iy
X-Received: by 2002:a05:6102:374c:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-71d5948c72bmr230971137.2.1781179449916;
        Thu, 11 Jun 2026 05:04:09 -0700 (PDT)
X-Received: by 2002:a05:6102:374c:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-71d5948c72bmr230784137.2.1781179446795;
        Thu, 11 Jun 2026 05:04:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm10883829a12.21.2026.06.11.05.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:04:04 -0700 (PDT)
Message-ID: <34796b1c-7c82-46fc-87c9-6c0b9327e894@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:04:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins
 config
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4quUzxp0ZrJOw9OaqVN8vjcPeeVE6Wza
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfXwQ/MuD9z/rxO
 cNAJyVoz7iufC8h7zO4UtegRLTISuRXko1BQLxOv3jKPkXOyfa1MER3Dv8rsZxbQAutWHGOFfQU
 279HeCMkEGQIaejO/R99thG6+zl2bW8=
X-Proofpoint-GUID: 4quUzxp0ZrJOw9OaqVN8vjcPeeVE6Wza
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2aa43b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IZRSYuELQJJGqPscr9cA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfXxn4BYj7MF/Aq
 foxvWlIlVqlXLDXkcn4tEuMVMyUlznbf2J0M0haprNsSIHN4SC6fiJEyx0jWo4wuDTtxoMyNuum
 KyiOr+a1pGSZXr4pWgEB3ZWa0bXxj+pbmBimiVnXV+8uC5VVS6AByQ0mrunSWrDqVg+hwDr2Y14
 pIJaBCCymW0hZgLZKdPbsUMQ8ebY76hlZ8TmqK3lWsx7P5hYPcDPthjW2bNjlh7zuJRvHoKALe5
 DGwa4XR7PLC3YAfPS3vlZImZgcJFCSsKEcfZvfvhxj24Yn5L81QE/wb32vC9GT6qy+bEIuh6YYw
 Dy7FvlcNP6v7q8liFp5mFnFAzytp8lKyyQYsz9Oh0zN47CqecbfsWX8LBONHsAXgmvgzXWPJ2Du
 8LPrZi1VlYlL+FARRPoad4HD3Xv213/IwJwnTseeYxAjgQCsL7fDxenJvnMtVM/EO66ybnWPKXF
 gJTHJtXEqI2A6frQRjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110121

On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
> Bluetooth or other similar applications). Add all 4 pins to the default
> pinctrl entry for the UART.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
