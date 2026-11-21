Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281494;
	b=rMewV6aH+95RalEN7iqv5w5MZA3zIzBVrjCN2rFXQoQEl3znIoXiUq80rDwLph9Adfgj
	 ncwerc9VP9UJX0wY/jpZbo5vGKwjgKnQcRdoO/oQ1vPTBHSswN8YILNQSlxLnIM4X4dcf
	 fqQNmUua3Ob8dli1JMOcxhLtKtaSzpb+p4JBA9tfK6wvgdmThkGYrgdF1SazcSOYgHmaL
	 SZ/t/7WMNNc7zadvRZ/M/zwG9+DFnCya0b7iApb4amrNxR0U9dPzaPfbUya27v3XvKA+0
	 1YQgJ4/NmeQ07xBOVW5v4IKXxnHV/w/yVKSORD0HlGOZGLygojMJvwzh8bEOHxUmTAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
	b=OhThlPDQQIhKH/aQgAVYMpAfZsg2G0l6HfKu9oBKzQnwZH7nr//bf86qkErTR1qQtPtn
	 W3eKbxF/5xpp8atPJxTNjM1D+FaOn9bBw366cctJ+MFUB76nrICHVF/Sab8YPx1ZJ3vnz
	 Yl8sL9rBGqa6Edq4DGpQ/4bAdDdhdZlr1c4M5dJEjfSvB6VBMI3eC2aWusnmV+t02k9E2
	 PBxdT8ce7w7vpFaDzOAEsyBSX4xUa/BMHVewiEvpu1mac2uzePl6YY6kIzLETPti88JSP
	 kMR0YKAo476/v7Yu+zjWHNlB9IHxxxsf9b4FoLA1qXuvJcB5MB3N9ss22fPLkXAWF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abc2+r3t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEtsQyEQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56247606A32A
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56247606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abc2+r3t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEtsQyEQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFbmgV911502
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=03VTQUvtN+Jv+TFLhgycleO7
	JIZPD71MArYB34m/8/0=; b=abc2+r3tcdLKrXCqaPyBRnh06SBQTSCrC9mVPVED
	/UipiJc2XVtXNXRza1BfPueE5+t1TmX3lvTLfA+EzNV0UIWlPJQsZN6l/BtXzGwL
	tSwBlN3STr79yK/OY980zUhIgQbkXbEQ+itiz3ZYP09ChWFGiOxcIEOHqnAz6+vR
	ElRjN11JGN5dK/0mj+blp5aqe+ILtjw/m4ITVT3hm0q3XujT9tHV5UxLRhaULzK6
	bkGXVgQU6NrtqdGOTyn+yeKIKfC1Fsz5BHvVrDnje88/+dyDcOkdTwOXY2ThZliC
	fYnOyo+MjLIrcVVpZz577yHycu0zZg9cmOPrTIMvXJMztA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h31m27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:18:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so198302785a.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 09:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795281491; x=1795886291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
        b=iEtsQyEQ1El8/D/GwdKuoN9X5SiszsQQHe/v5QoMOB7MAdIjR9PXOFVZa9Ewd8Uurv
         5wFk5bzB7058DOkCrf8TpBK2Z8Hi95aFH9X8R5TEJA26uz5ikqeQyMMudpZa6ulsKmqZ
         M1ki4Mxq+UN6RDVCXJr4eh/zL4+pZbiV2W3AQ8b/iwoaSyTfrPlJsXyHDwmOWoKmCq79
         gx88fkajCQjNTSXuXPdn9zvSCJKXls5kY+BnT0Cf53hgctNeGYXXtocfv6mA/7rZJyv1
         eIvhLDhYsz+nmdBoFu3Xs5IL0wymD8K8h5V7cMelpDvk0FevG2Kc0aejUciBLWdyaYp/
         Dufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281491; x=1795886291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
        b=ag3AD7YwUS6srYLcTxGDlbhVIhNP28VfSUfdg7vcsEIJMa764rotNIyZ1Lag4/ZEoj
         qXSACNdOtushFTiPLwYNQHaAwYi/Vkby+cl5dfs8cDBhCJuYu7mZ3VJN2CLitcnEyBFz
         VoPBLDoEN9SDJyde+TMhuSEqS/m/PJWcAGyLtVlXkvqHsXRCc+ZUgAh4LyOYVA2n4r34
         Kw3lTkWphcXzmvNl8ypcHAne2xKMBCSNyowU7yQ9DhxB1zYFqmRv2zZWQbjMEdKXtUZx
         Mr/CNq9vmeDQEMmKUDdgjsolmHuQDqdVydtolLOoPwKfn1BjbjcHKkMwP+E++sT2iinL
         fx6w==
X-Forwarded-Encrypted: i=1; AL+hErGjBwQ8k52vBbYWyU64UJjboYZjrl6y5uvJaKHse96HBJyDnVXWfN9RAdUKAb0WFhkdMYnn13pTdIm4@vger.kernel.org
X-Gm-Message-State: APuU4Z8F4Oaptwr9supjJhJnTZ0w2wDzu/B4Cj+JDDz4BaY4ioe3dq54
	JjhEQaGbev6bDaSTMyGncVOvsIPvo5Q4AsPc2kNLO49Qx0FpOPK/jrlbMQaQ80iPQHPOVZLE0S/
	Qk5k3CgjIyg49La5CCWWfgNlYkZ0ayGxJy0ocO+P8n04EEpy4WnUbG2oRnvPcKvX1
X-Gm-Gg: AZFdTZcMacUJzpuAEwsq9s/xSj7L+BQH/9rp1tCvfGXRhZcmI/zH8tsfGzw4cKvhRsx
	u+0si3p0PNdj5Ve1PRJlY/1E1pSISpHcEgTgzFnCWLtSdWsF8dNrJeNG7aqRwsEPbiMFTIVAJgt
	YTdOC97smdi6mzYZKdrk6KvnYfB1kVdYkQDUy2scic3Z2i0oQTIQGtR+j/z7ZpQ30Hy6M74dSBz
	0ULbdPc3stVy3pim3/Ag369vjvIMOJetxzZj70YnGRvQAj+Ht51RUUGzpESoYMjduoVcVgQBkK5
	bWZ3DpWq893EmKfA0BqNgcZZ+Hj9hWLN3WigKOIt2u+wKRonl4+BylsnoNfPMKR/9W8apqoJQND
	pdBSKsa2+Yv7TMCWBDP+mfrPT7Uu5PFlGL4s5ep09NlO3a86Zp9rk+0efjquW95/e
X-Received: by 2002:a05:620a:4443:b0:949:78dc:f90c with SMTP id af79cd13be357-949bab4d991mr1084815985a.60.1795281491345;
        Sat, 21 Nov 2026 09:18:11 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:78dc:f90c with SMTP id af79cd13be357-949bab4d991mr1084808885a.60.1795281490526;
        Sat, 21 Nov 2026 09:18:10 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm237635335e9.10.2026.11.21.09.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:18:09 -0800 (PST)
Date: Sat, 21 Nov 2026 19:18:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Message-ID: <x5wpvqcrs7xe5hxijyjvoqlkojmwc4eqbw2su6q67ibfmzjvdz@m4kd6gz3iyuh>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
 <infkyto252rc2ocolww4ihjuptd5xg5qcjtkft7gpyssxhp234@4dnragxtdfxm>
 <20261121-excellent-sociable-limpet-fddb4a@quoll>
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
In-Reply-To: <20261121-excellent-sociable-limpet-fddb4a@quoll>
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b01d254 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=AVuSvmmuOnOpfVppq-QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: BInkOYxdxPNbGLoUBNVo4rTz-KFUjmh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfXyoZo9pVm7SHf
 7zjtvxK9HRM94K+u7LyN6Z2i6/Z58SGFJTvSMfZo/53uPPGMwJ4OInufJ3Sncu6i/X29KY2bbLj
 zY7zIyyVU4FzjzInOSsNcgplP8fykL1BZxC8CJr6QrWb6YFbBkVfMUQQGTn8RSmqZCaORhrnW91
 Zx9YVoiIGnGMK3my6dxwTDAe8lK9lplM0imHfWWJhM+EY2UBjgJhwMP4mytFGKEsa1hOmGEESI8
 rB60gXFkwL5OI9Ri7jejjqtAPLNS16SpyIHhZXeiMqOvxxNfn3IwWWfNTBYdf5Jo5vmaEOHlYtY
 o8uybCJ1M+6TM2XpX5+gDvyNspJwEwhHplNqihLEuNn6oPhbxdUDRjOr96mQHIVP2GnANWqE/PC
 bQ7fbS30IXs+0sYN8k7NREQZN+6Ah//XqAmNAWmslW/QbVgSXxnPvUrX+nf8z+KSY8DcIqln8RY
 39tmvCBrqnGdpnZM60w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfXyAkp5Trr9NCq
 sn7UswFymayvrbPk5hjVA6wiBTuaQr797HOJvQnkITa54EyDlr6CxBvPGmlOmcuG8CBtftAMeqx
 Co6bfNhCOcTmzaq+Gv+E1QuZ0S+Q61A=
X-Proofpoint-GUID: BInkOYxdxPNbGLoUBNVo4rTz-KFUjmh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210068

On 26-11-21 11:36:16, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 10:35:27AM +0200, Abel Vesa wrote:
> > On 26-11-19 10:51:25, Griffin Kroah-Hartman wrote:
> > > Update the node for the DW9800K for correctness.
> > > 
> > > Now we correctly select SAC3 mode and enable timing-control with the newly
> > > updated device tree bindings.
> > > 
> > > This is a breaking change for a part that was previously functioning,
> > > but only due to manual register writes in the driver. Now that we have
> > > the correct documentation we are able to update everything to ensure
> > > functionality with other devices using this part.
> > > 
> > > Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> > 
> > With Fixes tag addeed:
> 
> Why? The DTS if backported without drivers, e.g. by other projects,
> would stop working, no?

Hm, I guess you are right. It doesn't fix a functional issue. It only
fixes initial broken design. So no fixes tag then.

Thanks for spotting this.
