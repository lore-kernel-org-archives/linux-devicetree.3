Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077C3E3DA7
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052811; cv=none; b=Lr6pR6DdBtGUHA0kifal8QPxGlAPcJpvQNepuj/M+jB1yzl3HkRNjAqrRK/Gm70v1yAO+doJruiAHjnt6A+MefsBlSlnn96LD9iePxTHQyQScPlPIEG8wU9hNKDrusUSUalC6+At4PBUb0bQ3itfm5WQM52EEvJbx7Kl0k824H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052811; c=relaxed/simple;
	bh=5dpxBtPjL/1We/b/berArCohSZzNadUZ18yBSPmQdsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNjymtWpz6j/KwHSyRrY5KhUuZFqa5WwdXqXhzwfW3tSLVsn5m9EUaAj2eMu82Fj3StzdOqWo/I6foXnEoi1zLc5BnJFLlcvzHkaJKMI/JBg6s4j44OSqcFtAWiLe5hAtrLNagb00nT7nsoXBR9Vp1hVqIYrcoZyEAmJLffezo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RswhHagH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRTjIDAT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RswhHagH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRTjIDAT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABbQa1336405
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/0AlltLVAB4v9U8rw8sJFLO7JW+elllAbiTuLyTWcA=; b=RswhHagH44dRKgdW
	USZ/u5vuvLrWzVtxsT01TpGQdbVoXkGvNn4L3aMuwiUKa/iTy+0nktKR0p02aSkb
	D/AuoAzmu7+kTxAweAOzxoM6sFbmjTzJPX5oJNADAFVczIJ1LUo/yfc0LpRHiQbK
	d74fnsEQDMZoiXt5nq+/ndmmzHK18x1aiKqLJmXgN+muobTIfwLw4IofxNDjK0PR
	Kp9JrhcQshEW8mQiu+c+hDvzzzAU6lSmo9C7CrTX7PgiN9Gp5ox6ir1qiWalYcrr
	J6OEEiJ9D64EDYtXpZ3Yyz4VptLPhlVdZexl2WUD8u4t96glShXyA4jN1bPne3DT
	TWRMZg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp1t7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:33:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so8325156d6.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052809; x=1787657609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/0AlltLVAB4v9U8rw8sJFLO7JW+elllAbiTuLyTWcA=;
        b=GRTjIDATbum8a5Y0AcLB/+hZCaqdezn3XrtZISvUBVVRPrstb1FbP3Ysu6hVxbe4sV
         lNS6Oowj2zGezFi27WWjMqbdacx2OKPC65tkxUQ3U2dvwDSoS9T7pmSvfR6rFzuZcIOw
         2+PGfHVL0ELdO892gs2+oXwKunFrla8odW+nyxzFHlCtOjbX2e7kWC4S1lQEFHqVjcR0
         +ofPFMO1OYXe1W6FbL3wX4HlWRZPvI9R4oKxCyo9snB8rnuG/P1agyO3jbGA0LJ5pI9e
         HWZCtD7vuyRxhkDsy07uLYxq1WkLMrRJPp7gLLFpzbneKEcMs0ZlTBiVv1QKmlbiYxtJ
         eUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052809; x=1787657609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/0AlltLVAB4v9U8rw8sJFLO7JW+elllAbiTuLyTWcA=;
        b=LdNbG5W/2nKk5gTSWNXDx+SHIInLl41a3+dBVdykwze+GVnXWr/oNCHSJ8QP82j1eL
         8DztWgaW9xLefpr+0r/vOVWb8u3CcBzbWMNuGGTIAtCpzHZzOjh4IMLLAJX6j7/5NDAV
         MGkNE4eRQYdnl+eqmZb05a471NCzWmp/jZz44EQXI2WxGoBUdKZ/vbWtdniF8jpsyZEa
         xpS3PyC4r75tqr1/OyeKGk1UX239LxwJucapasysYVWZj27TNgFBHPWLmCv/nBv0sWZk
         1HkhUq/+5DUu3nDf2W6rLLFjek7P05ySfsM0Ya8T2I5lW+rhH8WN59FDh5Z7pqjVTqHl
         ee5w==
X-Forwarded-Encrypted: i=1; AHgh+RrmM02VsdOzfQY2ZmFCt4eBBzBf0t/WeMkdR3DPsQ4rwGOBZgahcpsL5+bUMac321IVjlGvufYIKkkC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/l48xV/O07lBxoKOC+IPR9bzy32ocVxf7+NCYCOcjh7TS4rb1
	EiCspOnUcM4wl29ZzL0yTGIU3L0ITJIGZqVjX7g4REKUj0qj7Cx36RqBUuzD1TbWmnr57oWGrQw
	Dy/CTisdp9raFiZj6CvmvgtSQeUgKOv+WK3r93LnzgQwFUW/Z9lv5VvUIrrd0v+4fN9anFTNu
X-Gm-Gg: AR+sD12JnQQHFAFdSOfiW8ul/PbFTGUOhvjaUzk7OfO3bMffqkoEXi7Nnstb8ns8ral
	H2pjo35rEaEc67Qttzm7HN1G5uQ5MiGv1MS8Cnbl5b9msPNa7B8h6yeIXk2ALJKyqaEXJFNlCfC
	fwFQ6V1dTEv+OXWxvDU/cY9aGPIEKuF8kWnTcGOj0YlsRuWwjFkGjK3nee2qKWBw42vRbKv/Fhl
	RfxDHPgATiNrNiUB1WMXD9bwNIi0e/zd44ZZD18uJRKU9q8Qn2EMUl/KRauKIEDby7ycU9PeB20
	uORlyoCPJMF3RRtLlFfWBD4IG2LbFUxHUIzkfOkziYqqUMfeUir3UItBziDQWi1EEuBpIW150jH
	28RkzSTWbs18WLqVGXFSUKGXk
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr239522131cf.3.1787052808712;
        Tue, 18 Aug 2026 04:33:28 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr239521671cf.3.1787052808222;
        Tue, 18 Aug 2026 04:33:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85a30b7sm1642193a12.30.2026.08.18.04.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:33:27 -0700 (PDT)
Message-ID: <c9531134-4986-41f4-9433-ce172e1f88c9@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:33:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: Add Glymur QCB
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xoYPDk97GDQ3Eu-R99th9ZtnNqlray0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX5ZBu7drzm+95
 mCKr9VNsh8Pp2mt6GSUDoHnMh6vVsxRUyuzeWGU8b2Zt4Urcs+Y3ukQDRhAIvE0QtyJxtu5J6Ov
 gH/2ymPVx5gtmCLvXLi4vhnl+R2tNmZLBn7RJTIHo4Mll3jXpkvrZO8Mg8VhsEI+DcvJrNGEOd1
 IJpP+LORXpoqGv14rzrxNwqtRtlx/e4pDXMXK7cinhUZ6AL5wxuaOZWNVxVI2WNFevZ+qqHJF6O
 yGxrCFXGSiHxKnK1dygvWamiuFJa37/VOsP7F86YNAlrpqcoYGX1z8YwxQzSn8fJ8NwyuIpAi1I
 mPEzV1L5P8/ZALt+WqeIPEi5/CpWnJOtpJRp3+xqE5EnrAICIUhNL7rs65KypRNcC0jenVlDLxm
 ZYylL1NBHlsICLUH1VjLVf4yyMIA2+NCa2sYAagRuVHmgLrKb1z99GrCy8rjGuNJAtMKxgiae4j
 Tyyp+wxsg8zoMwAii8A==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a844309 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=U76MQq4rjxy0e2oczCIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfXzDOpActFUcbi
 EyaMAVDavqcPZKZxZ9l9+Ws3BI1VCq7Ydb7n+B1zTkrgMIizZdZG+I9TfFAdIVfyRniigvLcuyC
 0al4tGJV4f6UoZpFt2BHG7hnwJqLb/E=
X-Proofpoint-GUID: xoYPDk97GDQ3Eu-R99th9ZtnNqlray0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180085

On 8/10/26 3:03 PM, Gopikrishna Garmidi wrote:
> Add initial support for the Glymur QCB (Qualcomm Compute Board), a board
> built on Qualcomm's Glymur SoC.
> 
> Unlike the CRD's closed enclosure, the QCB is an open form factor, suited
> for bring-up and power, signal measurement.
> 
> The base support boots to shell with rootfs on NVMe.
> 
> This series adds the bindings the board relies on before enabling the
> device tree itself:
> - Document the qcom,glymur-qcb board compatible.
> - Document the qcom,glymur-qcb-ec embedded controller compatible.
> - Allow QSEECOM on the Glymur QCB so efivars and the UEFI-backed RTC work.
> 
> Features enabled in the device tree:
> 1. Board and sleep clocks
> 2. Volume up/down keys
> 3. PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
> 4. PCIe4/5/6 controllers and PHYs
> 5. WCN7850 WiFi on PCIe4 and Bluetooth on UART14
> 6. Embedded controller on I2C9
> 7. ADSP and CDSP remote processors, with a firmware path for SoCCP
> 8. TCSR refgen and QREF reference supplies
> 
> ---
> Changes in v2:
> - Add TCSR refgen and QREF reference supplies to the Glymur QCB device tree
> - Rebase on top of the latest linux-next tag
> - Picked up Reviewed-by tags
> - Drop Konrad Dybcio's Reviewed-by tag because the patch has changed

The change was minor, so it's not a problem. But I appreciate that you
chose to be on the safe side!

Konrad
