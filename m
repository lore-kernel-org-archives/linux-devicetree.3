Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956436;
	b=y3NWk4cHwKodJHAmYKwp2LtwAuI0chV/sSi7xB8j+HhHqmUmmRWb+SpobA+dNWgO+MWw
	 5UctF3EgSd2qfnp6FxvF0Epj72C5379Kw7kQ/pBssFQuroeCSS7CRjDd+yuirac39dbpt
	 QLBxy8reJJCyHmav8/1rjTTnyAzc2hPciibEuNvgxf7RUwciOEaICSsmncVFErooW33dG
	 lJFlX99LGReiyZn3F2d4DFbILsTb4G8e0pdakgb8ClI70DlnYPR/BUy/Zjv1Iz9vr7Nsy
	 dSTUHQWLDJSUfxjI7icIUqTcq9igxKJmQFCVA7JhAiZxj1LK2ZYwjAoGnInQ0WsIaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
	b=3gPFO1XaapDzUGxK7F5r3RXa62SDBTsY7GgUGrwcsCHuLdZfToVQauSkrehKH/EZziLT
	 yt9Uc21wdZ6nyT2p5fBNYtdegK9EC8w4i7Zcjb8OBJfthDdQNjt47dWBiYrPMrRr8pI2d
	 2Pc0uRlu2wJrF0EoElXHwdTi07RuL7qqVdxNqdq1zhrrDTnfNpCgOK/nWBuHI5zN7aLMl
	 Oj2qUkiKLBWcAcga15EPMJn3LCS8OtjuFFqPfgBdqPrnnrp8vKIhWMkwl7qSk8P89cxeq
	 QY+vGz6ub0Td9dbkDAOsN+C/rKk2exbx09szkpGVhn19hyTX3LWrf/28P8iINeVvLmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjU0Wgdo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUKcgbmW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4E606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD4E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjU0Wgdo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUKcgbmW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RONx2933643
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+mqe3MwnqN5gPVSMUZCJY7j
	nzPClbnClecQsC+GqSg=; b=OjU0WgdoKjr8OAJ6LFtGpoyEW9/cNidtU+wvJrDB
	m8tm26GM3QDPWy4vWs+I2K/WyWPB5w3eLUGoZpZA8bgkzkmfdrtk5LGag/jsIpHZ
	SCdxuW9FOLufbHmY54eNUqPAIYgd+33b1VqrRYvUCcd9+9+LG0lF0/yUqzkj237P
	jrWqmMezFGrC2sHuCBjt5ESGUTOiThx6WhzY1Oz12GRl4h/Vz9Zb0d33Q4SEpa6y
	AexRNBkQEc8bE7dy1/agGEPpLEdaIOJ6XZRrI6YZTvjFnzOlXQU78XEvVCu7GJJt
	OgW2xlF69Hp+nyfXP2qOalbBkau2wkbImwysu/w3pI10Mw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa22cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:13:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2592374eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956434; x=1794561234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
        b=BUKcgbmWWyaO6oaCLaFgKAi3x+3vQl8xa2Gdtwfrtj3/Ro34pUr/v4yZsdbijtqez0
         wa7nKRmtC7e3B0zdt24lm6L/rZdasf4HEgX1dqZIwzzgyZSElhBxXuULHsktg4XsYrBf
         YW0t1BB9O0qAwjLSOMY0cDDIMHZ9OYONt1uVn/Gy6vgcNJ+Vida7xJp+PrbsCDtzSmgN
         FBFLQY7SyHScpP1V+4Cdp64FA5G+ZVZWtb0KAPY8w7pBVquPlxc1G4CihhTfgfkq3Ih5
         Jo6DW6baaBRghQOW1lm0OgNekltINlMe1tTH03NHwHRGd+4kGBxB/6k5gzeRfEPaiXik
         81dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956434; x=1794561234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
        b=2NDyX4H2EQpmgXw8GwSxGb9hyjgKGdhZrPYL+3BJKAG03cqFKW3kMHh9om+KwrcVX6
         DmJtVjey4X71i8kMxwjetH9bttO6RNF1mRoG3Ot4/EeIpeo10q7sQFpZp7Q6tMHarsCL
         KClCz9rG7gjmBAIWs3uNjTt2CmYdekGJC1yS+8GYzcymFRQVRKVWXB0DxEulqdwrjUUW
         Cav/vXrdgqWycZMMS6Io6gvuaiKroG22/qUb7Z/NmUaRd5i1X4AtyUfpU0HQVrliiMuX
         WvS96w0QE+GWtjJH72+n0cLNyI4zygPLRqJkEWu/S1WzWqRGhqxc0l8PbhaaDWTQKDGP
         KqvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9I2LX9T1amSyaKHbB+7Cdff2AYlDHEK//MHyQLe7M9Fp3Gcngoy0PoDSEUnrn1KZMWpBUYYs7T9wo@vger.kernel.org
X-Gm-Message-State: APuU4Z9QL8tR6KTKrs7RuRjR6vWu39pTUpQOdG/T05vbSgHhjn2cIfWU
	pliMXCHstjknWBKOCfM+UgyovW15av61t3bBjfMQJOddlNGBNS8y5NQYBMhDcaH91jJvysXbJ4b
	MS+2pY+9aGuSRcKbfTmtQqeLjB7VSVYLrLKIIyCTaA2d7x2suTXy5Ry3hTFQIxgM1
X-Gm-Gg: AYBFou1qJlyGUROSku7afBdw2IbvsuTl/hj3lSYCNH6HfnHdRrfrdy3rDRHqZr28Dfp
	MTan/PVZ3VMiigYsRxWci9R7EtwxCLGxyDnh8Irdbkb9WtOZSjGEY4SzU2l11SF4O7IMu0T3zmj
	RwwI1J/o/Muf9uU3qpY9szMM0oHp5AR2Hd+h25s2e02J4U0NzmHGCR/7PqPm7/ik/g+rwHiEwiP
	+h83/rSPJC1nOnV3o+DPZimIPbLfsm9OHV6DSlG9NaxjIudNmgB+piEl+DkXrRfygsGcsfC1W6I
	g9iO7JvyXm0KC60HNOV1KadpgHY1mqoKOdKEjiojiQ3YBdxCMU8FWGCzOswDeRifJPhgXomrl+g
	WJspL3BX1651pRoN3sK0Yp3636ZVtX2oElTh342Glk4kVfSFX2CPdhPi7gvfLP3qTrVBi2Kw8gw
	==
X-Received: by 2002:a05:7022:4381:b0:196:7590:8bed with SMTP id a92af1059eb24-1b25d285a22mr3210856c88.2.1793956434095;
        Fri, 06 Nov 2026 01:13:54 -0800 (PST)
X-Received: by 2002:a05:7022:4381:b0:196:7590:8bed with SMTP id a92af1059eb24-1b25d285a22mr3210814c88.2.1793956433582;
        Fri, 06 Nov 2026 01:13:53 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm7709079c88.5.2026.11.06.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:13:52 -0800 (PST)
Date: Fri, 6 Nov 2026 14:43:47 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Message-ID: <au2aS7m7DrpA6B9R@hu-raryan-hyd.qualcomm.com>
References: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
 <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
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
In-Reply-To: <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
X-Proofpoint-GUID: 52aKyq253UUVDLgzsRprmZsklMCEiFWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX5Aj8MyagElOk
 W2gG/LLEHZxEDEc95ljFxAwBKENtjJQkIsFvrW6ILUCGzagjBNYdPrhvh6GgqqrGrJ2VtkcY8Tl
 Fgvy6Fx8dL4vzJpKpkmwEyy/Vh+qAHo1PD53P1Z9j38Rh7O3stZMEl02sSAzaCe2reinMsNPoDx
 oCmDPYl7zvZy3vCwd8gwCndHAdyKpJOqqV1CCbqJDbtrrwPbdFVp7Pu5VCAM6OduniQwcPd1ywX
 KccP5Mg6PyeBuWD3VFbzF8bomc5c37Nr2yEQ2IcBmSgg/ZRRuiBvQnGuRA8km3/Yi7m+mMS0ZnR
 1K3rbiGniBEAlK6GkcvkJRKN81Jhr948jfr2VEtdEYTwTIfO5GfLvsH2Uh093VWzCq99vzCxFym
 iNMHQ3hnHFaJMCkvLsnu2nGPqfZVpOa702geIoeAdoSd3hGPU2ZkOCbHjSCh6Vfok3NksB+HSyP
 ToV9HebQQUvwGJyWC7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX7mudTMQIRkmu
 iPDmoNzv0Fi0XaJHpaipPsfBHZVQ1Xa1aKxmThmCg7OpF5yaf+VOwwmcqxu1kulaos6KOZHfcRw
 HEIzJ7IMN+oaZneV4C4bnXXA7zyZ+Vk=
X-Proofpoint-ORIG-GUID: 52aKyq253UUVDLgzsRprmZsklMCEiFWB
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed9a53 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=E6EYp718zQjunR1OsgUA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060036

On Mon, Nov 02, 2026 at 02:06:27PM +0100, Konrad Dybcio wrote:
> On 10/29/26 2:47 PM, Raj Aryan wrote:
> > Add ADC channels for msm, quiet and xo thermistors along with
> > their ADC thermal bridge nodes and thermal zones for PMIC
> > thermal mitigation.
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Moved XO channel into pmic DTSI file. 
> 
> You only moved the channel, not the associated nodes, please
> complete that.
> 
> Konrad

This change is specific to agatti QRB2210-RBI board, if we move the
associated nodes in pmic DTSI file, then it might get included by 
other board files which might not be exposing them.

Shall I still go ahead and make changes as per your suggestions?

Thanks & Regards
Raj Aryan
