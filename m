Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191520;
	b=H2zCXqus5slG5qOJEtsFp3MBGVrg8+bUJl8dEeeRBeQY78Cf6LuUZXQ3ZVDu+RbR3OEb
	 kGDEsqBo5YAG9TbcdZsoZ5ugx1ZqKQ1Zf8P3ed3h78SiNK2TwjgDAJ4/wqlVtmJOD3YLl
	 cM4gcZJuvapYOu95ScCK3ekVl1hGUdWCADwhOT1wTK0ZRsmDH36WS3VWZj7otmCuZp1ov
	 6x52NsXnOXmiuKmDVAfnG7tLFgk+xX1I8EyTQ4NZSKk2ziM2X8S8Pvj9TdYRA1YR6xG6+
	 iFYCJY8vEDkrifq1M3V1qvhFDL8GjmHMV+1Q/uGxsbu91dn/P+m8seAnvLn3em56cLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
	b=gGEMdp+pY71cWGpMKhknX9Ojl7cdFOegEMsRAvDLpZQnlyjC6QcGQKRsX24IBzbDySlT
	 +uIzgSKW2WpWnReICZEtk1ry8ZLvWQw3Mq3BvsFye4eTbglH5nbsgFudVbgJIsYgx0pHs
	 RUXSk2Ux8VEhsDnNbO5NN2Gi1Ute5zy4f8yGLDZ7e8Lh2BIrMQKjfkabsczRQJIigRnWq
	 ISC9D/3aL0E8UORKndB+mWw5tDNvUqhWSRDDkW1MQqB3fRX8aa3GmKDquCzxTYIQ/2UB/
	 qJi7E+0PsLy4QooZcN9X+aXllqDhD0Bh0iBx1j7ovwQ4ud868jj2x7zYBtmeBLA9K5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfY1NQzN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2eXXTGJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE1606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0FE1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfY1NQzN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2eXXTGJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H5qm3514088
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 02:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SFrqMGiGYXTqFUF13dP6f7C
	gotj6WnY/CKyUSighPs=; b=MfY1NQzNlgTlzpdnjDkdCyR45kO+Y6SrUk21XBhs
	+0ldf71sxm9viqmWjP50XeV0MdEgrhEZc68hBHc/1H+Wnca+9zMbgD1cnE3jVoFw
	Db1Xss3ir39qcW78GW++YwKsD4880GikqvvVsOzc32KDesGnfoNJhhLMDja6FV7F
	Lsab48oGjW0JMdveYXwbhfj5wsR6cWkPigI4h0sV4da8uWdGc3A6Kwxnbu5vcuUO
	PWJPOlzvPdqn+5Hk8nlvXanIti/9jprJ8Bzx++Hl3PwV4ndrpM+7ex4eO7urH+Nw
	RsfkUXANQNXWib90mUq350pKl1U3C08usjqiqhEzML424Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxcd8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:31:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso107759c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794191518; x=1794796318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
        b=A2eXXTGJ0cjVkA6JHUp6iTxttBqXeGkWIfhgaAD0fP3uuKicNVg9Qe3A3uIrgyMeWu
         ZHpDjntMmrK4w4aRTdI4zyJGmE75ICgLqKoIEdOa0XLggh1rGFno+bXvnkoKx+0iRAMr
         MqEuwmnyIw9ZzdqqbfX5GGofrLHB1+PZrPr4bqSmDyalQajZR5bFvUU26Vm/rY69PeJi
         zJLB+n0arM2OOTSkKZnN2mITRsv6iSf4PxpCoaq1ZAeiZT+YVRAqGqt7oGNuQw5/+1Hg
         rR99X02/81JqSmD5x9lkTz+eRD/gcDxyFPpb0zxLU7DlAlsKPacUKtOB6FiAectpXKNS
         EjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191518; x=1794796318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
        b=HlgGhj/IHuMomy04YJRualuNJP3vh3/fAFhwezyNzLhuPfEmlfA2G+ZUMnUYUvgoKn
         EieuSKiwNDgAOdw8tYToCwIgViePtsn/2j5i+GHWL0iMszTe0zUQ2eLKONXSoVY9YkpO
         z7HU23Xqr6wGHoHGFUsGizX/ZPBRRX6X1cRlDpm3tUFodQUGm6XIUdDkiz3qJyZEyXDz
         sFwjrO+9GqZo7oaGVNw7c70sOejk5UlWAkBCv21S+hRaFzZcuanuwtFwY8lhPL37oRXG
         T3JHpxuGbN93fY06TJGLVHwPLBQHouo0gU0maXboAmPtQtbCa3vVK1i+Kj82Qh/ECc8B
         1Btw==
X-Forwarded-Encrypted: i=1; AL+hErEd+s8V/bjufusz7v1eSoqhjjwB2Zkt6m/PW2hVEItpGSDmEH2ugOYMk3lgKP/9jWl6YplZCKt2IG8p@vger.kernel.org
X-Gm-Message-State: APuU4Z/v6sBaaJ1/ZD8Hpf7/9KgeeaoroN+CrJkd4acpygZzU4jlu+79
	SlYAsmKzRkI366pIn5nQGA7fAj4H6R4ptc4MxlQhrJN7OoXZNcnX6uE2GMfK1Lk5CJKmQicecT0
	/9VQLtz/AAo6JVpHFX7rlbCHTWyJFpgdgTU9KioNrOgadQfud5bzXfoxwAopFuAwW
X-Gm-Gg: AYBFou0DP+c/TpeBW1leQN6nfYsak6Q7F3F+17skYM5kPDufZhgjGHPqcPUAY1F2v/Q
	VKxu4bOadk8leXhR29WIzszPdrLK3WhG866RBbaqtUHybz5uRq3Vkn1lOiC9QWanTHuAsiFfVh+
	M90mnoFPx2rPYVGfTb2eTIvHCUZgEbJ80KL67fK6IiFATaQGOu37APh8trSZ2n9Oz+OnfcZctwt
	uSg7HFg1h7Z4q7EJSq806h8qJXaf0joL+tXAfPxsHuNPoMNBT4//NdTIzTzSsFF9VKFhxLAGuYc
	haiFTS+oCwwyGdzUuTSfKN6rw7xnMjPYi55Ii/PsnF+SOSs5lFLlCe7SQ98aoHRB8LVtovovRlR
	QHotTPwQavRMtx/AGQ/bjFjq/MXCW+hkCyuJL+I9FBT7WNg3NCdF19BfddLrJLUcn0XDztWMWAH
	mB/DJ+Q0/kTRkPVjHMPBPFxCTIQzs=
X-Received: by 2002:a05:701b:2905:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b39fecbe14mr4302377c88.16.1794191517845;
        Sun, 08 Nov 2026 18:31:57 -0800 (PST)
X-Received: by 2002:a05:701b:2905:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b39fecbe14mr4302325c88.16.1794191517129;
        Sun, 08 Nov 2026 18:31:57 -0800 (PST)
Received: from YUANJIEY2.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm9659808c88.0.2026.11.08.18.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:31:56 -0800 (PST)
Date: Mon, 9 Nov 2026 10:31:50 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] Initial support for Advantech SOM-DB5830
 board
Message-ID: <avEwlqGhRQz51b_0@YUANJIEY2.ap.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
 <179416929274.628393.12037192351352245383.b4-ty@b4>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179416929274.628393.12037192351352245383.b4-ty@b4>
X-Proofpoint-GUID: HOOsUScD-Fu4CEaLgqgIi-8CLyPmwgRj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfXw+HwyN2fDcYR
 Mp1460vr9/WjzyVPChEUmoG9AHDMKXR5uEldZW168rVsjo+5ad+TAI/rQc3MCYC8jEsyqzObp5l
 LUhGM0lL7031LyKDHxg55sFA3TaOSBIlSIqpLFpLoKom369O8zYAjsXbKqzYYLVaHo2cBbnkh/Z
 KnGDmzX6xTJZua7PoFqbqyMIMTh3wVa2fAuLhKX1fwwwpP1K4qwGD8CYYTYfojrdPn0+yiZty7b
 M4RlcUdAhSskljUE7G0pv9vmyI18XJyQO783Pkbxy5D9bXmbQL03IGS+BeBsJKHcZPuDNudghIh
 lyKz7iAql87JJND0aH/Vi9PCNCGK1w+yIiZzfi+3h0vHzXUi6B8op8gAO5byhnWuAP4iQwyR9+M
 rfdtIUwuFAwexzQocJMCbAoyq1QFXoAsvi8fhzT5jA6/ylrHoM9Y/sn2z2eiXMZ3u5Pu/+Y2rCW
 onLZ+Vn7PaR8s7sBcgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfX/o6WjNvrBH0E
 rvdX0LImuwtOSErmCA/0E3oFlW4wJjyAZVegumfs38XvtS+3Fx1EFrbj3Rfx/VSvrr0tDZe8EJt
 5MYjbY1AMDEi8RLewSrArxVjeWZwn+c=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1309e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=kNaXiPVJs_Xvx0yAIYMA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: HOOsUScD-Fu4CEaLgqgIi-8CLyPmwgRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090009

On Sun, Nov 08, 2026 at 02:21:40PM -0600, Bjorn Andersson wrote:
> 
> On Mon, 28 Sep 2026 11:18:47 +0800, Yuanjie Yang wrote:
> > Board layout:
> > +--------------------------------------------------+
> > |               SoM (Advantech SOM-6820)           |
> > |                                                  |
> > |   +------------------------------------------+   |
> > |   |     SiP (IQ X7181 EVK SiP)               |   |
> > |   |                                          |   |
> > |   |   +----------------------------------+   |   |
> > |   |   |   SoC (X1E80100)                 |   |   |
> > |   |   +----------------------------------+   |   |
> > |   |                                          |   |
> > |   +------------------------------------------+   |
> > |                                                  |
> > +------------------------+-------------------------+
> >                          |
> >                          |  Plugs into
> >                          v
> > +--------------------------------------------------+
> > |         Carrier Board (Advantech SOM-DB5830)     |
> > +--------------------------------------------------+
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
>       commit: 5fb1997399eb2e27086f1cdd160a120314358f1d
> 
> Best regards,

Hello Bjorn,

here you have merged this change in v4: https://lore.kernel.org/all/179065170995.2673486.7594805451558800807.b4-ty@b4/
and you do some change [bjorn: Added "-avantech" portion in filenames]

it is already in repo:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f28aec2091c949a0e2ba76ad6b5eda34301e0a


Thanks,
Yuanjie

> Bjorn Andersson <andersson@kernel.org>
