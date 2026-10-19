Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2F1499F3A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400835; cv=none; b=AKtYOLpDuKJkyyLE4g96PCMX+KxGmZqvFIwLdrBO/zAaRaHJ7sNOu4uhx7MimXLUmjstGAHzuzqy7WJ+cDVNJWDyyhVCnuWSjpncsAFn0dmBvPAvKUGvRbxlnFTOqVTSxy0lRByig4fmtTah0hjo6TikfdGrgsVBhLpmORS0f2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400835; c=relaxed/simple;
	bh=QiTiJjMnJoygnfwW3obAIo67pZvKlE4o8Z9bHfK8l2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBeUT4yGWXxdm2+F06IvdJW5qoSGARWdYBAmMh1MkPci+clsRrVT+DfYI7o4tuOazq/W7GbzeMOMTdQBzpLRz3+vQx4EoMEpeJibXkqfJ6F5oVibBdp5LCM0vqqJomqXxHTmtqkh3aJA8cENt6D2vP47T84M42t3BadQ3BoVrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1qdvTS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW8kBTsA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1qdvTS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW8kBTsA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Osii1665658
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=; b=H1qdvTS1gEMHnE9e
	7cn+ABxl4BSGpqY0Pp1SDKiTznKs2paoLAYfPus3JWuF33vg7uXnBl0fOxfPG+7x
	Uc+CUNpGw2L05vgcun8IllXs0Jjbi7DHcRcXbrHuYoqGRuEQYez9y1N5/mXokMHr
	IVy8qfUP6C1UxBB85PHX87sty6GWV8qw0Jg435FJ/pcQojn8rx2lXCfSPff/7SPP
	HGA9nGO8GSF+nF2lDHqu9N/3VN1ZIeGBtdpHgjXl5xWHA/YcLbiqRtLhI/h+wcOQ
	xMhQuAkqeU0CDiveH9oESKYbp4WARLPRlku/HN7ubEj5uNz//ZmZRCAPDye74Qcp
	6SunjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n09wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so26620785a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400833; x=1793005633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=AW8kBTsA4qwPojRoYWPy/Jhnmhv6df+DP58s7vBPY9BJvvBC0m34cb8Ec+4TmtFLR2
         a5yBmdJ28sJgCB5p52uv2LWUPKzUOVTwhhXtf6SL5k19RXJVv7LATq0/+OFKehbXgLwY
         TGix9lP4fh8h3zNChNAA4eBDa7BPrLi3KhG1wm9PBDjiuL1gfIx6GCMAhi72y0/ZWXJT
         dYanR2vbCY+ThV6IcvcVyMaO1nvs17LPBmhm7ol/WpqIZr6ujlvF1aAeX5yYhkj43+23
         baQuj1v4wbOgnxKzfiPgSp3rjXSQDh30+pdx0D6+JouLwVZRnxDlPceKFEAEBottkeQ6
         nBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400833; x=1793005633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=L7RAhocbp5NQqGRwfh8S/MF26ysSx6HygQIXYbWnyqc4AoZxS/fOfe76IDATivhMHR
         olInM+5vdLIb17Tl+RLXR672KIhc2iH9YJfdca1ouB1CAo4nJjVw1+WnKUE2bqWtwxNZ
         rEKqTJchJVtqKP3p36Q2rCBUnzGvebLj0QAjdG4d7H3iNSv7d/A05Z6pxQzVcqCxtOnW
         Spykknf1wmWWrKHPLuF9uFCvm4KqhWa0IHor/jTmELkZhElJBFw/uYwIhGoNb7VoeQym
         b06cTdiQC6xMmdFssE5/9O+PSdPti4NehhY6MMxVbvLQZ68vsAOSWgAo/8mGYgIvoraR
         7zOQ==
X-Forwarded-Encrypted: i=1; AKwUvByPJTLWopVOgvwRyARfEjmlyGF0Fk4F4ObYkcVzKzQyZ976/KTTwDqaqm0zZroN7Ln3J57ZDd33xzkY@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2Zy7zAhyBgsTavN8ozjkraibdmLB9AuQ/VoxNVNLz45GLSisS
	ftFh4YnkqrwKXTOOMBECQ7BI4l7xXEZmn0FKTox+AUnvOU7F76cH08wxtpqt873rbK/OBInMiH7
	GN128bIkO7a11/CW3R4WALLCCCbQW7glq2BZvYODon8D7kF0ivxkHw0LmQa5bmXDr
X-Gm-Gg: AYBFou2Xek8o3AYXuxIIDcYqKOnKtcsfC/PC6tm0N5ij38Qe55pDhk8/AHGTRYEo5Wo
	GafiRuttb/7CxzMUER1Qh7xexiK2Zg1CRnwAQrLolZ95rYVSC0ji9wLlpD5zI4itIR/5cq6LfvL
	4+2P3fralEqe+NpX8SvEXT4bgmCNNhCz5g/ZozuIkgXgq9abD6iD1xavNhzflt9UTPEYZBgnmBd
	fgnyX5TSdeYnieTGa9JA2o1IJaJJNwi/9r5YVCMcjueMBSrHDTTqXoycb5H8jKRUD8Nv9SxhA0o
	E29NZ5jW/MAYOHiYdDKrWL16hQnrS8VF8VT9ow+7TG/s3hEpJoH4Zk3iss5DwvSv0FMOX2X6luo
	VPJUFq1JNvbBN9w1LJ/Dzrg==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378750085a.4.1792400832695;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378746585a.4.1792400832262;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d66d6sm3577256a12.23.2026.10.19.02.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:10 -0700 (PDT)
Message-ID: <5fb55e28-b04c-4e18-a80c-2f2bb90f13c3@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX3/Ky6J9FbLmb
 +eIED/f2m40vPnvAiC9pYj9mBzxl9dipJ8WsXwBZTH+bqDZO9MBOEH3ddmfP4NNpaKcyXlrBIrq
 vBrOM6X3Qx7qC2FlxEbyCUyKngCKdcA=
X-Proofpoint-ORIG-GUID: 08rVzi2PhdqXtyAK0tCDcx5wM563bxoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX5fGh/nc24ZeZ
 Bs72/zv3ZGLFEgyT6xuvODs+mTaqHNiQDoOsbhNPYpxfI3d1yDc4foLiv6ot/8NQyZ+tG5ia/OJ
 5lMl+Z4OJGP8Jh28sAN5CUjHul1kScJUGx8ZiclVGwzZHETpWGNdFmLToKCNG3oPsRZjbXB85yE
 CzMmweUTrChtQTboFfzDkcLciBsOsxSpXM+UCVx3z6y74eycH33nYaRwjkZXtJjWJU0PdWBhXrs
 jMW/6y/I2Vm33YxQAGGbGkKf68eCH2lJB0B8iZkBicEXFkTH++xBUWgMI2mYk2/e4oaNLi4wRgC
 80KBB8xRtMVOuavA+BIMsk+Cf76mfmLd91C2vHhQ3Wmu/TT+GQ3PxSfG1lpk5NqOBy87sS5R8PW
 HMMF4bNZOUtIduwNNuU9oQihx/qRMF3A5/QNTwzirbMQb/52RSg7QxWchly1dgrtk6gck+FSMN4
 VxXnj0n0akVpZ/OFuuw==
X-Proofpoint-GUID: 08rVzi2PhdqXtyAK0tCDcx5wM563bxoE
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5ddc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bd4qqj497OEF_3r0wXwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
