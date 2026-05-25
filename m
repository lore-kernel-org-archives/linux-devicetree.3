Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47F3112AD
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713727; cv=none; b=UnEih1wAnLxqcRm0Ds//xxaryfvEmc+Gjfn2bAuas+92kcNO1ANm5MoWvmglvLRxzfdhQQDiABynnW9WO9OQkObkmakbvfYw8wIevQ/oxYF0mQSlaANk7GArb7Z4zbSd5JxQJIMzMN4RcFoqahg2i6DoBTeDAzj+iHJLRbp7aY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713727; c=relaxed/simple;
	bh=gRAzx6snyvOg0Ujex7rxFmLVCGMYSZjgFR6sMgNyQyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3710Uu+cI0fXINpk//QbFsEI53D/1uK3YZ6e+3Y6Z4YuBHqpQYD75amzC5rSveJOZp4NaD6G+j85qI+KEmjkDWOCW/YhSiq7C6holx4WQ4htSBUx+wYAHFmg1QVbHpfuqksFb3uk1yQXddvX3GFKvnVBK6c/kHGhpFftncSpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSgAGunF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRQq9WR4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgAGunF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRQq9WR4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBPW263263566
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gnk7ppNQ/8EXsY1yQ2ox1VRVu95Teavo3cDhuUNeAMU=; b=NSgAGunFSmjE5KTe
	dWCiTWYNxS4fjpGPcVkXOdlkO+witeoau1sSNojV8PQUSDpHC/KvnW8kgUvfFM9I
	N1S7xDapOlRbzbBUK6kKgZEB5i+FCK/SHlzf2TIdpK64Vu/vQ75w9YvMPS+cwqgi
	ZJzw4LFr5D1/Sz/E7+h/FgdvVC1GJMxI0HcbVkIClFGz7zacEEeROhiKzS7kLm1Y
	WaMcTrTYeACvCRoLvy8rh/6SWyArpBB7/T332zKfX7kyUY0RdFTOD+e8TtSD703e
	0d8X8OrZsFei6gO/KvIyyiw2LMD3HENWNScOI54bm3zoMEa0/LMB7tazNQFnmzVN
	LmEGuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs08h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914bec3dc03so70152385a.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713724; x=1780318524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gnk7ppNQ/8EXsY1yQ2ox1VRVu95Teavo3cDhuUNeAMU=;
        b=TRQq9WR4jIDiYisb1lV8rWc4zgcZD1jOBiy3Wz2pVgw6zjWoW7VI32dernKhqQ/jaf
         kySXtly0ZoUR7VPirfAqNS36cdR7wf51Xs+bjPFtbpkEWJnCbvsuy+8I0ZCEoCQjpZxe
         SfAwYJXQKTJy9NKpCiPHlGFU/NnrNoUcymv1Cegu/af38wBN2+ccNRzXXh2SS6d0AMPs
         rwYJTS+FdROWEZFziEs4FVl58uyXl1qYx6TYuTa6KrKIpO+ioUBs7vcUz+dwVzfr4jZ/
         9JU26AkBZnUgTfjyJGaDyPZxjtAN1yHaC3n99qCfWQllr3iLipV9G1uHceiscen+BgKF
         Z72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713724; x=1780318524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnk7ppNQ/8EXsY1yQ2ox1VRVu95Teavo3cDhuUNeAMU=;
        b=q7SbRSgjjbUofOpkcAZ4iTPentkqWbpuIfk1HktmvxlkXH2RuctUDtPdS1FXZ0R3/O
         mjEp+P94kigu2Keln4i4r7Niu84h9ox7zrILWKAG/HS9CbCWwUgkIObWLu60/s9RoPnn
         THY23Gi21z9oAXzN3wRlmEes55aHJtU8guKGnMGQzaqFitq1v1pTjWm0+OfA6X6eX1ea
         oQTpN9aQzkmAJRGPI0QdcjrszTLHs3ERTJHMWRPbnkJ4DcbTatv9tLHNXfQQkwQRMHxi
         WqMH+Dd7nLe9QVOJ2KAb7Df9LUTjIQWqTadrakWNTZ4ctUL+dHxwO5aYdNEnlNphOYE0
         2pTw==
X-Forwarded-Encrypted: i=1; AFNElJ+lJtCNF8NBiUErB5c3i1XzdkqT7fDB5b7RFnvtsZQyxkym2w19tbYg142u8wPR07Gpst5UhRest1LZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ovjUvU6d1qCWLdl++XG7xUxZRzLjVISJoC42k3P7vKt9Fd3j
	XCktGRqPB18GR7F5XNkigoWslQJstonQc8V483m14Nyq1e7fFS6q05XynaZa+9bAU3MtGZ/4PrY
	aYCvzGwVD1gxiIZrq37FHsCMK60g3yKChFek7klhXFRL+cYGzK9Ibe8V9KgMASRm/wN7IgfLP
X-Gm-Gg: Acq92OE9ueNWbhfpZvTg3jDmy5sW6NkGl5ElRRr5f5rXv/8tP82ewC+e5lSlfwuX4Xz
	Z3c+5V0F4zih9iB1w0BMZkHEpmoVpxZgbFJgrAqyC5stwz7xZVYEFD/IOaCMi85AZDZFnHhyrtr
	hEK6NNY9r8uI02O5Ynpn465PeQ4EX75+0w79YPuUUateToaQ3uedyNLNwuGvs1IsboRpPl75AEN
	jNCtuHUj7g9gs/Lg0EQfIZJ7HGXV4fm0Vo/kyg86Fg/KNF7FPGXwQRUORdRIy5JW3k/lhIPTYPZ
	aubyWJdsQ2aKqrTv1Rr/OsDlv+C3fPps5z52QMlX2+rtwPUMJje2jtERlroX2GPeWHjc1VY8ebp
	Bq5YQSviJ4mmNcV5M3PMjrOYo3oHLA84Gnq/IjWRo+P/HdQ==
X-Received: by 2002:a05:620a:172a:b0:8eb:605f:6ccb with SMTP id af79cd13be357-914b46c19demr1368224085a.2.1779713724494;
        Mon, 25 May 2026 05:55:24 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:8eb:605f:6ccb with SMTP id af79cd13be357-914b46c19demr1368221685a.2.1779713724068;
        Mon, 25 May 2026 05:55:24 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bd00e751sm3897925a12.27.2026.05.25.05.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:55:22 -0700 (PDT)
Message-ID: <af16ce41-7db4-40ff-a722-a95fd014970b@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:55:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] arm64: dts: qcom: shikra: Add DDR BWMON support
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-5-f51a9838dbaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-5-f51a9838dbaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a1446bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cJf_ainsN7bWJEJn368A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GLWm1fcy6I69xvyRHdtn51PWip9WmyFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMiBTYWx0ZWRfX4Eb2Vg01AfHc
 1mydEuNOvXDrtMPkSudUNZ1XTyi7ALWw22gs43ZdO1wvT1/yzlWSqc4OLhLXrBPFvmAK9EVTSsg
 DBfTDysCl9RKvdPBm3LL1lHCqpZRWFJqbF/mPxl7ycPr/IEA3u5ZZJD01WJYQSRxl10hQH0/7e1
 Gf6vK08tCzD0f+iqUlqlrksLmwDz8DZpcyod61VrK9YBHrbpwNH7tOUJRIW0Jiw77dFaOUttFrp
 Ntbtx9u9yRqudaBrAPkaD6Wr56JQPiO1r7bHf/eMtW2NzrDOorzQRpyQK3AnRj2l9XjseERx3KV
 4AwlZ08C1MBUCnrgWBiMq6vZyCA7bfozKLxnQciMmFRXTyb01TwO6CDSSTz6GJABAOcBtj31wz5
 tdZNPfFinwJXugmjRabjVvEtN7pqqvWfxfHvVRaKjKmRmn7echAq35D9SG96P52mwaSPKWCZJU1
 CbwP/eW4zzGxFIBrWxg==
X-Proofpoint-ORIG-GUID: GLWm1fcy6I69xvyRHdtn51PWip9WmyFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250132

On 5/24/26 9:49 PM, Komal Bajaj wrote:
> From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
> 
> Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
> Shikra SoC. This is necessary to enable power management and optimize
> system performance from the perspective of dynamically changing DDR
> frequencies.
> 
> Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
