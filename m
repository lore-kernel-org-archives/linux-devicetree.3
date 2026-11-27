Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758345;
	b=osUE7ZH6lm5EZPRvNQeQmNYwQIWLJLvtXMlxLXwKPJIwg0RWWH+4VnOK25xrjv2uKB3V
	 lChfnxC3Hy7+fApqjHqQdKsrwXfAVb7EVPW+M/Ky8L/g1so0DQDSee69dntwiYJ71mmng
	 s+yks6+oR+xFD18ukqGvcme1V7pM/StWCn972F8d9LGlLrmlYah6nlkD7S1kgrZybodD/
	 gm/ADht0AgYDzH2FrCnH50DN2BBTSKCHfXfotXwZC4Val1g6fbfvxZtoeoMd1/YjoWoOk
	 uTfLj2BJkwhjRYOu9ywj6oe0Y14M7HTcX+rj/zjix3hhlJrFQz8soNqEOzdCwZs1Cew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hJdEygyyrDZKJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=;
	b=IRSBENX9RC6SAkYtkXDU6i4ABNUjVzc+MhoEVA7q8oC4HuDz1HK6PhvXNWmUr+sMnEaF
	 IMEdhYT78zQ96X9e2LZPCkxq1QUrKt8DCFVuIx6wNYMZZqtKV7sMR6KOGvHojhH6pIef8
	 8yuwhZzvVIJQEFgoT2C2NxHzikOLxhOsMCiUMgJ1Pk9tyyJf5rMPbJDhoCidrYSYEENgA
	 juBVlk7bxMpIJwXS/oeThcJekZ4pidwS5ybd+httQE006g14uKlgiaSSUPTN9dO/7fTIz
	 mWa4kPHMi5UQUuAP9MDfRkx0g3CKO00hN76Z62dBEdOmtEHyPI6DLUn6/snAVdlVd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9fEWqg0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TvAEwP3g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211EB606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9fEWqg0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TvAEwP3g
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwm6w162587
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hJdEygyyrDZ
	KJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=; b=l9fEWqg0QdnD1tAWX42PLnHSY2i
	yFTCfIUsuD6P7I9ypbRcnFPAFNC7KCaK6u4B/pk+g/r58I2UHeKnUf7Hl3zEr/+r
	SfIMH7+2AFypRsxAFi4lc/agBayNRpJk0z1FIeRIghJSR2GXwf3RaHmh73VBMot/
	MeoFLPGy8PsQyWKOloHJK2mavUn9j2B27P4CY5xrd0MfLWyhMyiYzCrBILBDDWGP
	M57hp8mpfhx2d14JggeOQpbpRXzN1U6pW0GcKOJ22Hi1EG1bPsc90/8/GRyD9dVI
	iLllkB92uGQyWPuKm9ONTT47DFkMX/4ZwNQ+1MUyQa1rhP6pgfSYU9aukKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7gbkxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so7242235a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758343; x=1796363143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJdEygyyrDZKJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=;
        b=TvAEwP3gVAPEPAO5kwm3hANV9BjEhTz3UA9JwczWbCmD5eBqzm3IF/dlW+vMqD8UZq
         g2I8At/ai+sCw46SqTIP2uHtKR+g4d3kLk09KQ4r/eAM1tnmzD8/1yuIerATQP6Xa0hN
         vUNbRUm42PEtkDkfP4qPwYZVEr/GfPjalMMSRpLRWDSgKXVQSCCjBmNBZzVTFtb/P+Zw
         yr1ABQdGgVa5s+PL31gpHQmZXnjeeRTD7Xx/Sl5UDIMDDAjX3ALqSskKIQCrHc9HRX8j
         nJfxYI4ZeIhZ+OpSdT1dipDibEakDurpdiGGYKiACtuKDdbrLyKouuYqybPMwPxiMUVW
         q9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758343; x=1796363143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJdEygyyrDZKJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=;
        b=R1ElxDWXiGfxMqQ9XW36tFvSSWB+NvRxrdv4pUvUwf8UdJjJ/Eb/Rqbn+0bujZfY5m
         cpeP6Ux2cthk+xTM/CMhSqpOJbs0qVGrDxYi5j9bpgiTv+o5PLI46F0Zd/in4AuzLVuj
         kYmkX0cOj0nstfqvfft5A/lzSjhgkkk8o0ymox4rog3hevcdt5pC9eFNys5J96oQCdNz
         erUIt5IorgsS+EHDL5/u9K4ygr7U/iRWOlwpliDT7vtf2ctcNLkR8uPLGenX/KjIo5gj
         L6F2SJukbTy24gBab7QDUH2JGpCiuFQR/8TaV76ZZGyRYuUyPQ5eeYj8QU1tIsmrHIiu
         56Vw==
X-Forwarded-Encrypted: i=1; AL+hErGa+nb9b9KqVwNxllboxIZhNK6ElHyn14zXNwnlTJEh6hlVyG14F8LkDL/y/AbRuzL95npPtj9c9/p9@vger.kernel.org
X-Gm-Message-State: APuU4Z8dn3ewYfTg5FFR3k01q/ni3DTEuBR4WC7bBm77fPlQo7faHMI9
	GL8fnsBJkTfPvAlGJ3SmjWwJlxFiBdNc2lXa9Um9CjfsefowPpLJlt3RvV3S6f3ko8tAssVW+hv
	QyH1VTFVSNFSr3dXXebvWF8TFUjpx4TAoyOocCGwi8l54yWakn73eXiegO/gZeyu+
X-Gm-Gg: AZFdTZfAKX727XuO4CfIQwcDbseSLgrc069Ba0PUlU5MP1b8gSERxg6fOWGF7B39yi/
	srjVSqzOGsBSOaY7uw20TA8QP+50hwVXS7y5YEuVmPGQs1KYWL0I8V0iXXKr6jiP4qIEdWg+8Dp
	xhmLBDQAiTXnXEF1ahWNyuI7TQY2DrUTbBO1EwCAhu3aQIAqkq5r+AIAq0ymSlWEbYtDCpmiqjJ
	mN7jtyV5wSLh7+yXIZH/617aE4sHXDtgKFccn86LlZWMPC++PNSx3W6UbjEkOC9dU3o4BDmYKEd
	rIsSvFjuD33XYBg6Y668MyHqQ0C1o2vDB+fkijJU10cOFjEDitIWb8VKmPdDy/kfixIOrMNmZma
	xK2eZA2BlZNn+4W9GHsNKwaRvZx6W6ajRq65F+rkKfh1vxOI9cuyPLJmWLr9bbPWhdHaa9dQ=
X-Received: by 2002:a17:90b:5287:b0:3b4:402:b3fa with SMTP id 98e67ed59e1d1-3b41c8fe1edmr22183516a91.18.1795758343134;
        Thu, 26 Nov 2026 21:45:43 -0800 (PST)
X-Received: by 2002:a17:90b:5287:b0:3b4:402:b3fa with SMTP id 98e67ed59e1d1-3b41c8fe1edmr22183485a91.18.1795758342617;
        Thu, 26 Nov 2026 21:45:42 -0800 (PST)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36124198a91.15.2026.11.26.21.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:45:42 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH 0/4] misc: fastrpc: add HPASS domain support
Date: Fri, 27 Nov 2026 11:15:36 +0530
Message-Id: <20261127054536.646943-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V_GlVc-m56rnAxVmgtVLOzsCXoedqSS7
X-Proofpoint-GUID: V_GlVc-m56rnAxVmgtVLOzsCXoedqSS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXwJsfiu68/02n
 CLv/JUSUa8Gsqss0LLjFO4B9ZUeGhxCVrJbM9m0QZkmI+1WDp2Mb/AOxNfoqubGmcKJqsbgHVgG
 04hb+RG+pi4VYvnLe2h0UxzH83kRwGZiVU+udUz/kkqWgR2JuJMo/pZwSwR9zuASgIczhFl4qEA
 wilF5MARWjGNKA1VfS0HOpeSf1FaGAIjRQke6oOLlbm7fjVK84dELUTw6m+DxaehuD+ZsZGCY86
 K+PWBG0mN+p9OdwfdLT9w8JicKq22jR0+Fb8HQOV2xZKXZR4Be1XVBE+gGCDMrlWlZjUCi+66Mb
 14nUEZ00YSvs7Hj+0ygX3JZtd3jtmndhBEESVanPBFA5Nwx3KLbeq6h7THApgFrwQU5mXrIUPgE
 W7PhayiGHDt9xzu3aZ2C6LBBjg+aCI4q2kXaAmO+OtsZ90dRJHi8VhIfScVGCkGkxLLyqwx6hGh
 VH/ujZVFBybO33QV8AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX4hbPSQFSiviF
 haX0tBQCsMX4PxxR4XKbTiWrJxDj0gLXGGrvoUKr86li11KEGWEbV6sK+rvWY8pFzfbsrkPodZV
 fzGR1CFYOSxnapYYuD6ch44djJZg8Io=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b091908 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=HMxxIxWglf0TOBfGhZcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

I'm dropping this series for now, will revisit later. Please disregard.
Thanks for the review.

Regards,
Anandu
