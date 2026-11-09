Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230601;
	b=y93q0oRhwYTxnPyKtZtZVZEcC2sZfYsTOhkj12Fogt79ayGYscgt2xOcNNLpvj8uedJK
	 DOX+gggU5lkj41BMpeVwuxUQUBDpLop2COYFu1+sszZuJlwdqJDm2wc8tJNwg2mwHhcnZ
	 vfd8Uh3lDbaI8E7GmEr8DXRNdYTpARJIeLHmm2a/20Oa2qDEdve6a1dVUqxYcgkeceNdt
	 REAIniZ8K80fhpgQVGm4T4uBXcjjS3wxFMr3V49WtqRjkiUQN8ayACQr+eOfiO8HFR+23
	 eif2Fd6YqLBCvV5BlkoR1itOe3vHwe3f7LV7k2c8wU1PJsHyLP8hB3SlfMkokFmkuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
	b=L4YzvbEYlz9yW3SaqbrmSKhJt5vBXm6HTQA0InmovoDqTX2duxw5ZSpVvv2JM+gVhKu1
	 7BtdNhsn2jccOMEtzp5jwuEYC9pp0x3TPSW3Wbr2INxcLDzyKdWypbGpO/uWHMl4Z4U9q
	 jskSS2YYHuHf6DE3vsLktcy8WV+tioq/8arzsG5yoqd1VRzU0PTuk9XVG0r58JwmasADd
	 t0Oq3VERX2+paB8VJqC6/ck6SzibigwMhQTa34NBRScHzR/VotWTD43SM28e8Y2S7/kdS
	 XzxoBRnA0rbAn133QcDerEnL0eDHVAzAlnV0ehZhCcMBXZs7xVxb0rbiD10XLyHYhoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/BIXBsg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZmAcvBx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010A606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8010A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/BIXBsg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZmAcvBx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEx3N2927788
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 13:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=; b=M/BIXBsg82eDIWDu
	Gtjk8+TSKT+Brp662poczEHYVOPsSTrobjMTy5g9eNMJqw4WUOrZ95XdSOamrBLf
	pjVfaaI7YtwzV0cMkBuWshkZiJKyoTO03T+LGzXGunjapX7bStCWZSMyevAMzh7/
	m9wuAEgpxH0Eo47hRcbLDi8bXdcqV2UvdqhACdo+KHYFjnY+1kIXWPKCD8t4+B5Z
	Dsuf3lkO/mkUcpfDeqCPRJHxjPKDSwAZrpspFw9Qm4vqTBkWrQ8YuXDAaObeRJ7K
	0PDxhkF18LuJQfooaE3KEj4kNFRgz1PAxOv3Z+kf1jrs6/AnhswMCakqyDX6OiVo
	q6+YNA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8rqu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 13:23:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so17268137.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230600; x=1794835400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
        b=hZmAcvBxaqluH1Np1+5BLk8BnE01+KIJyLulyErXoha47DA3nLZreZi0QJ0D7TUUs2
         motAuNtRxB727rfhVtn2Jtbh2FJO2FTlsZlp+0yv1dtczNgYXT1Hu45zQ+qLtRaf1MkK
         aV3mToIOXi8Fl9UE1bN4R3AURZS9VBTOUoRSEc2RNBKcpf0ohOQk7aBdasZYUjmKXy1F
         8I/RcBz3gY6pKZqADStYP+50V4cgWyT5tXCYd47Sm3CtfH+Cvf2bFwpUNPJOkU0DNC4k
         iOwOVoDis4m8KQdDt4x7hxTTvT8SPiULA1Kb/ajsdIzwHXNmR3Lesop9pjVf7mclsotQ
         xvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230600; x=1794835400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
        b=mvTXBIrrkqGqDTbvLfvH1GDTy5Wdgx8Igt8VVdsahERCd0eYZFtFiby6IDZYL2TYhz
         maH4LQXdu7G2C2sYXGCqqOhDu3FlZWa6s1r086ZVJTfwIdB3W0NIOmDjpb0D93zodnPP
         k5W/wBm5DGNNJ6vPB4f1LjohobRs3bKW1UAa+z7hbhJ+YnYCK4b2rFYiwpR2H82wFfp5
         KIZQqhZwEw+Ydm+MDU0uEu/eO9Ja/r3AaoKpP+SpUqPd6Wr6YNjewZsIpt4R746Rvd2J
         MuVtg9Ub/ga6c9HZ42V5Pt1kVRrzYS06DAZw9SZ9dm9/VYI6BH1vuwLhvhVQgTODHGFO
         bXtQ==
X-Forwarded-Encrypted: i=1; AL+hErFoWjYV1Rve7WNl9bz6xL2dnMzZ5HK8vlDmVBA/X+cJd1m9MyruqHcjFqY8z5OcrFOKNCqBydCArpfC@vger.kernel.org
X-Gm-Message-State: APuU4Z8VABvyt/NUSA2OrfOQf+W60Pgz+Uc4BbCAtNzW5WsxEKhkXle4
	sL4704nJbRd4ARJRYfzCOFkb6RlbqjnMbCWqph3XHFfScPeh0aSD6sTcnJAS+lRF8B0Qvgy9/h1
	YvdL/CwvAdriToEQ2A9n/m0dqCHOcSkVpXCNPYX49R+VjK4oehwOpwqarRBGdYqtyNwBx7NcH
X-Gm-Gg: AYBFou2N1uCiKikwBn3rJ7wC2VfXQ5YrDnQ6fA3SXTvHjxUi4jNOJAxw5Yu61DveUvu
	0c80HfhsQOAQOIbs4ONiu0jAOtGpeu/taqZtS3lT3fETHFDbfnZMaUpRCdiBVhUO+ETSOHYX6Ud
	d/ieo+4UdsPyAlOGplYQQ8yrPhR1jt80YdK9nxR0g05Y05oXL4FA6lu6S1VYuA0GJGQdf/Np6mE
	sqmGjG0hTDGLlxZZb8Fn1h48LHdhlEVAiUREWGCI0qEesf9jca5LYKkgiqdeSUSE2PGsGOOZIVW
	524aqSPk/DmjjeB9Iz7UCD2EIv2fAikuj+gcNkDSPQpPZIokCZfc56KNs2u2GumRsVLO0nfnZGm
	bbRgFpAC/kx0wXqVGxbk6db/uvm8ZIhM4pp1nG9b0hhEBIIsZQp4l/50U5kWPr/e6JsoA/g==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr841116e0c.1.1794230599698;
        Mon, 09 Nov 2026 05:23:19 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr841100e0c.1.1794230599135;
        Mon, 09 Nov 2026 05:23:19 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4acc0esm165261366b.49.2026.11.09.05.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:23:18 -0800 (PST)
Message-ID: <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:23:15 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20261107022453.159341-1-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX48WOpyYGiENR
 J3VXuF53NVLnL6AUy10wWPhodl6OHUCK39giJqFexYf3oozrpHQLPkfcCh94GdFRMvgwO+fX+B8
 VjKN2fFeSJWT7y4TXJCMGBhA8QMPIEiimF3cQrXDPq72+Whe0n/r/eEGGnQ2PAdnAncGdCQNth1
 kyp36BbZCJ8U/NST5/FrmsFQ5T1GJcYpXHdxBH0Bt7TDfZPxZ8geKtrZp4sX6NmOo7iXtLH+eed
 lSEUNleCJSSzkF2el1XQCCqWssHgvs71VYsv6SKs4YC9Q9uuxpQeOvCmY6d3pl6e6Ne/oOIz8Ec
 RYMj/P8rQikXUDUYpArZ0QAXnvrMhhDa9ELyao8UpXr3xf3MyUtX4EJ9f6VZ9PlcP7v4WQV2oCE
 YdMOJI0525kcBqsFrbdINkTImFTqo+V8wzfvV2/q418Abr4QQSwzPpxmSFJduofzSFHuTimrUMf
 rnhgljL2am9cz2DLTTQ==
X-Proofpoint-GUID: MUXd2o2F9RES90PpV0bs3t1tzfmhLu36
X-Proofpoint-ORIG-GUID: MUXd2o2F9RES90PpV0bs3t1tzfmhLu36
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXw17jqyuGno3U
 vft+6p6r0zQsliNdHpYQXJfSWLTzhNuBCYwBdJXw69vzM81YYe+Xd5qsMHwH6/Q98sN5saQtJ7a
 IAvOg78zCl+x74JLiAmuYKLZeooB8N0=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1c948 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=d1-rQg67RIlivpgk:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Fgcgf8ka6cmR_l9moMMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/7/26 3:24 AM, Richard Acayan wrote:
> This series adds a user for the SDM660 sound support code [1]. It also
> adds the ADSP remoteproc for SDM670.
> 
> [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> 
> Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
> - stop using fallback compatible and add lcx power domain (3-5/9)

Can you share the output of `cat /sys/kernel/debug/cmd-db`?
The SoC also has a LMX domain, which downstream seems not to wire
up to the DSP for some reason.

Konrad
