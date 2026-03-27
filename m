Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D73D813E
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604244; cv=none; b=YcOC6JRIALX/msHU6fjEb55Mm+GOPDaRdbpoGlU56nmp7DKtCKRb1cTz+kk6IiOoElf4GiggWNUZDXIG45+RlFr639XDFTmSyhjh0izr+LICyzyYuzevQnf5NJ7hT867jFFrYZN2cK6B2KXQ1/1fPtiGf1UIbZlDSVqOkP0hvzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604244; c=relaxed/simple;
	bh=QVjWxoIhSWsWeVvlwSrxXKaecHVGrd43CQ9DTfwQJjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0saKJ0T+B2J86wHcaia/VlQpSeEGnRlGSSCYdOnoS2EI9+J1ilu48SWEx21MgDCVWXiYvJKWpw6JmlNWU7ibHbq9S9dds+T4iNGm6NVVuMBkw9V8MzrPGo/qk/oPRp1b/fDQZd78Ga8KhGqN1FhP+hljKzzSgVMJsw0DdosVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtVXCx3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jupeu8DQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtVXCx3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jupeu8DQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wwsQ2846529
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=; b=NtVXCx3DWCsrm8px
	sPRmCJxUAGYZrUu+aeholz+Ol3Le6y8vP+1kzrfps4Xp09hQqUNT6834YrbzWow6
	RrnEwI/SDThghV85i04+ZbNnBp3fvKvs/rFjHK7yK31wkXC5NJ74j7xBKY/NqqTx
	Nn2juPFSShbO8n+ujExFYR1Hs/hgUgxLVlkHh07mvA1ckEkMW4ghquCB9zJkv+K/
	QpYAUSEK9yfMNLwcr+RN3LN9L+zXz28mjR8G8bmdtU52cZZ7c32XQ/ApiOeUSKmq
	7H3uGVjURATxjKCAXk1XZD4E6zwg5Xl9ZjmlYirOY9PI2bWc9cfj4u4NPRI3asQS
	xVc4aA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmekx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:37:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4bd8e77dso5297751cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604241; x=1775209041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=;
        b=Jupeu8DQTbcn4HwUXfcevx1+2WICIVSBRnALaKjyrIEnxDmIkp6q5Y3v5NK3Ojfe7W
         V8Xh+/1H64o/SCF8C9FSG+niOQF+Y50oqlrZKxmi1uP9KRQBgvPZa0vJ9WGjQPvB7BC8
         r5CZbF2aR9p9fI22eUaZ1ltQ1TXbm/eZ1zYutnsBMKbrfNgTiNm5lk/qPPb3C9GSRRV5
         juaVMhdlBN4S/fvGM3b0mxq50vn4qmjVBNIl7NZDmz6oNbenEvyCtMTVGMbUcSTJDWKu
         IZngQ1lpNh9FplEy8dqqMU4NeNkQtyJsk+nMdtzXLtH7qeWu3OwqaS0h13V6LSAxP8/f
         N/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604241; x=1775209041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=;
        b=DXsTd+1fsJjyBm+giCL7zkRDFsASXohbKBxWlSBhg+CAhMGCHr3wE65DBMUAbgaOwV
         9++ZAt/73sHStdmz7anlZRMqSsaQeXzvyXp5AnhgZUiO3Os3TO04uhMbbfWoM9O+Pe9H
         vOULRLn+mwmgS1LxGtHRbDMknm+kG2MM4ObuXgYhA1v1mEXpbPWBYnzrpyef2Hl3KuM1
         WT1P+LcyhOVOLHEUsR4laS92q6F2K/VegxGr15QTMm/6Hhle6Za5e/Q42ZrorprlX5ie
         HEbnsU1Tiw/cyXTPD1la5dAkUI0MJC5hEx5Uk3/B5/m6lxlXcsAoEAkJNKrBcGvPIyRx
         S7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ90vRkzVHXfr5BOkpwFK8QTbBptybaJlbacG1NwqdLQJwzKrNvDwlq18HUwVVBDu5lrPXnhGkXTDG@vger.kernel.org
X-Gm-Message-State: AOJu0YytlOSyKHzSs31g2RcynE5XVFdHVPzhvFeCkGR/QBvgDPOFzxZp
	Ni3H3ra5PAC887m41jlrGI3bVQINqzwwv7w2lle311qLg7qfVYFh8snhvBZu4wSsDdr0XUWuS9A
	h5QGJHWupKHIvVaG4SYZVtje2hxYbXpg0Yqdhk/0Fz3/YNHh/r3HzFnjLRDFSvaYy
X-Gm-Gg: ATEYQzym1HLU7lUxaxsd+ruU7VPAMazdRxElmQMdf9Y7oHp4r34SIlLip2cW/RJXxXy
	uuh4dbNmnKT7Rc6EUQvxCiA3NsfyD4HjCa1NzMTWNxBnxm0TvWvX8JxiNszYvrQqm8YU/uzrRO+
	0g/+42GFOXVpaT654c5lTssEpss+g4EQj3gDy8uoD+LtcMXh4b8UpTBfrmZLfft+xkWSbLsDP1G
	68FUq2+kee6lfX4XIpZcwqUwXYEVTfcM0gErGj+AeBdp7byrUHCeIX9MtpY13QwOdp/a3TKjmqs
	BRs1SGNm9MGjX6xT87ILW3r+4yEK0IZVYBSVZOofmZmGmgQ+q/m+R5P3rKqv3BNBcatGrN3sG87
	Kn8SJYI4Fi1zzVWIdrBvaRvd7IZishZiH9CclfcwBKsnpdKcPiCU571MCvHpJxt+Q+ZRdjr2bIg
	BdUx8=
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr16513211cf.8.1774604241554;
        Fri, 27 Mar 2026 02:37:21 -0700 (PDT)
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr16513091cf.8.1774604241126;
        Fri, 27 Mar 2026 02:37:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6048508sm2026149a12.13.2026.03.27.02.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:37:20 -0700 (PDT)
Message-ID: <8feedeb3-e244-4615-b819-dea39300fc2f@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:37:18 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfX+I3l5XiAJ+0H
 ughV6otL1q3um/KWTFafWccxPwzMxN1eUM2p2I2iLEt51ks63SrLNzPauD8DXULcfU+q924yd+u
 dNVB+FUKa+ujAvFa216KOi84nfcCYvgoflqCXFskjup7jJ68WCL+R/qaZuMfyxIvPF5oYiiC5cC
 8FT2TM9vpkjcZA/2jK8Y6xmCKGzB5YWy9Fhlcq2h0ye6DFTPjL0x+Plu2kl3+ZmZm1+22cPUx+v
 Tl0N/wcLvwHbV90JrAxkTHBNivcGMhpLp2mRrcX8OFFG6JA7js1Rpy8rX90k9bKt3mIzyQIMmZ9
 N6fndG7puaUH6EPoqfQEjCidLv2tBiPBky/MgRQbo3Dgdqc03nE7FfP6JsVaNlpbLD851AKe+uF
 cK9pbYjV/Kzd+CjxuXATArO+4d+q5ZJ2TQyJFKgVqjJi/I05wPq9GzqnTFDdL8Vsm5fSraMAfD4
 FlZiOfOnPR8Nb87CsLA==
X-Proofpoint-GUID: C2rUkBUBtNyP5hIHdhuxjlyDol8SQ12k
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c64fd2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S3gobNufr5BrtecctxwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: C2rUkBUBtNyP5hIHdhuxjlyDol8SQ12k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070

On 3/27/26 9:31 AM, Canfeng Zhuang wrote:
> The monaco-evk mezzanine connector supports a robot expansion board that
> requires UART6, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART6 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
