Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B121A23A4
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774405893; cv=pass; b=dpxq2CgsQYzk3wvLpwn80/Zo1XtbRUaKsC8H8x4bkbAiktzqyaErM4+8RRPATErD494Rfr+BOsoGcSDFPG0d0mcP40eAq6JOdAVWUJEzkW6Yc5Xxiowrrvoq3X8G7A0y9aH+vV/E+UAQoAUq0FSiK1BUThb7REanmvX5eI+sDDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774405893; c=relaxed/simple;
	bh=jYQ+nFfz/JuXlVa98dNyQAgI1duW+MnsVxSFH43aB6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFVm4sW8xfI31u0V4NmEmEnhKO9dal1Cm1uvFviXZYctvvGMeenKcqRMSpkFtsTRQPdBMbuqY3rI5t67xq3lCZ1VWcNyLd7I/+7B/+xxQ8ePlDZjIFjhFweWTgAAATFJWJKrl4uhkBYdon3gQz8wsHpocr0opAmayYtNjtV7C38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdZtuiIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtoqjXeh; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdZtuiIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtoqjXeh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCs2f104394
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1ecNg33BXnd8FIwwFk/kNazy
	X5nLnep0wIUCVx2Mpkw=; b=fdZtuiIe2gYZknKDrne/4AOcYC415j6Vu+pDG2hJ
	tB/Gbk7Ym3nArt1oYdydIRUQnNtLp4XuNwtLMlJ/YXVxYeNCyAJCoONcAtGnVHfG
	167WiffsENSwrWdo3/bN08u0cKVBZ/9gzAbogwsfxynu/BfaapxTZJW7pF175Tqp
	+Fudukrr5Om/P3IKAvv33skDxumwGP/2zZM5cAXJhE6mmnJSNX0a/hR5WGxu+4t3
	bY2lHhlp43Zqqgr9OCRGA3HRu7eh/9T6hO11Gq6E46Fb57bdBR7XCGP/bhXBEsTu
	+5B58LSmwapjUo8RNRmwcNfIWNbTgWh9mGj4xudp+xaq7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0k9jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:31:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0601ff3d9so34416605ad.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 19:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774405890; cv=none;
        d=google.com; s=arc-20240605;
        b=CdY9UqKQJcsQhk0RQmAeXptwFIPGOQX+nsEN25jspG60cbtJcemTN+o++sDecLMTKC
         rGFcETBEddY8CNrA9ECGbjgsKZqmL3tCBYECKxvoObeASejXxIM89RXWHA8ifBBRUrti
         pXEoM+Ub7Iqs72bgbIN+zigAyZDwoRq2yRwrPzXaQp8O+q38+9AlcmboCqjgXGUmxWM7
         5NrozqAFGWIHxMNzL2CDq8mRqGHCxCEYzYoBJMbJcv+qH+GaG0awhQ49EIP30E4oKYtx
         FU+GLtaX0XF55aK7QIsO7PlEGfasku8FksrvMzgpSSoFjNKgaCQ96dUQijCfdW+X1RUx
         koSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ecNg33BXnd8FIwwFk/kNazyX5nLnep0wIUCVx2Mpkw=;
        fh=9I8F4xxINISLfb4P81l30z7wigEFLuYlPZhTc25xxTs=;
        b=MAfsGaao7kh6b1Gv2yP9TG1G99zsQB7SY1+CHrsRNBWOI+VJSNMELgmO4fmlwbBAna
         ubxVhq6AJzbUmF687wEYmOrO3fT54+9p8E72KBxHjeauikQVwepHjkZgGP7JjKGCm5QX
         yXHxuz0YwJjVkPPYaafzw7od/X28fqSbGA6JjykQqzX060hK5XjcfRdGoZaE3Gv5Ud1e
         m8DLIRYmJ7NglEEj1Z0hNCG0cB26unfk0IgH85aRAiYfmBq4hURjBAzRjg5c0Ww7SMmN
         zY7/gaSRBH7kTKxpZg4Mzow46zL9p837IYHBNf6KbxCzSLLbM0DPbIFXu01QnSRTLvSX
         M1sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774405890; x=1775010690; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ecNg33BXnd8FIwwFk/kNazyX5nLnep0wIUCVx2Mpkw=;
        b=OtoqjXehkxPuSiM+pD4VI4An0wo8iideeCBwWWjtvji3GuCGMOeC+bbABsNgj7r2se
         g3NFOkkOWEw73pBSw6tuRWi7geGKcEUzLDB+8xkoOcN/MfiBWsXVk49o6UN2HrnM2zm7
         XBtGaLT2wG58h1XFVvmWPGnx1rPnRcNOJG/9sqEO2OjAId3AZTDHymxOU1q9zDH/9gz8
         fOu0qsjyuT+yK3v36JWNM1TXANGgRbq4PB/iKOvgmGSMSRctsXHM4oyMMq1HkMN2CG/A
         2ajkZSArCt2wUKoy4oldttSAyf5Js6qQG6XgHMYkCi29jKNkBwayt4B1HuvkoBmBhY7Q
         7FmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405890; x=1775010690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ecNg33BXnd8FIwwFk/kNazyX5nLnep0wIUCVx2Mpkw=;
        b=OknttbmfDupPMCbKMGvVOlOSNCNahPazGIEAMFoDwxboJCJFnUhA0fknrqt7YfCZZ4
         FMQFNVJRSwcwDdDiTToxwFsHDEQFmXeLOEehcLDFsV9mzlkFC2M7LK2YhE7Fzg1OegB8
         6SRtftWuhIbPxRKPVYaaEAAd6EtEhmY87xfgm9MBLhpmemgfVCdzsgXtNze9dgEgkF8x
         Q8tHJMBCxZjcSa6wJwaHD1wl0r9fb2MttvpV3Rl6Rrhg8DonGf3w4oRTPzYzhoy3Q9HJ
         EFhDW/RLrOmAvEJoLaO1ysOTiFL66Ipf4nlzxoW7EBjK7hF4ALEG6HrDRQksFsa0kJIj
         XDiA==
X-Forwarded-Encrypted: i=1; AJvYcCWaW+CKWvKACKft/PC8Ox19Y1oOSd+3ne8n0RCzH5iiq6XL/gm58gl22x1/wvYDFAjY1f0W59bdTzEn@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZrkrP1hkP3sE0wxnnOnOh5cYEGvG3twjzUVxVZJ/LxWeL234
	U3bSuItc0H0cL5Wg8AYW1JnBvCd2mxbCWts1Qzo7VZ5Srq9n+VKZX2YatKHLYjkxBrPr0NXiBIu
	JLtqYqfGr9bBiny1xcvWz5GcUs3OcOzZX9xeDpwTCriOOqAhAxY7oJCehUejvUlR5sgSyGzJ+k6
	QTfp8ySQvV8iHhq1TVGiNyNhi1gfNxNLrVO8xhuUo=
X-Gm-Gg: ATEYQzw90kxU1LDL7x5QSsVS19Er/eXO/hlzOuKNwOzcmbdKo0p7mGd5l99y9F+Ux+2
	0o2eVUtZg3eoN4HDH6S4m/Kgyq9Hl4SClNvRtd+krpX6lIM/nKLnV+/gHW4iyKYreKV72Z6TeNq
	3cOmOAUk77Qqx6Ac9TYaG6wuGDH+tuaZ85BblVNfNX2ARR85IyLiXB8Iz3v021GTy6fTGnpewjz
	TNUI8A=
X-Received: by 2002:a17:902:e54f:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b0b0abfc7cmr19727725ad.41.1774405890267;
        Tue, 24 Mar 2026 19:31:30 -0700 (PDT)
X-Received: by 2002:a17:902:e54f:b0:2b0:67fa:dbf8 with SMTP id
 d9443c01a7336-2b0b0abfc7cmr19727355ad.41.1774405889714; Tue, 24 Mar 2026
 19:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-lt8713sx-bridge-driver-v5-0-6cc2a855aafa@oss.qualcomm.com>
 <177345419701.98253.11507693763985665579.b4-ty@oss.qualcomm.com> <CAPM=9tzAQaZbzpVw521cwBc2btWC4AK488edwuDE5D+Z6d6QYw@mail.gmail.com>
In-Reply-To: <CAPM=9tzAQaZbzpVw521cwBc2btWC4AK488edwuDE5D+Z6d6QYw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 04:31:18 +0200
X-Gm-Features: AaiRm50iUBDZT09wWWUTotuSx7Merw6EUyoVPC0MmHa3YQK_6ldwzXMeBMyZoso
Message-ID: <CAO9ioeXf_BAXOS6unjZDZ0G-dC4ktLAzBgFn7-tF+XE_oAxiNA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add lontium lt8713sx bridge driver
To: Dave Airlie <airlied@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Simon Zhu <xmzhu@lontium.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxNyBTYWx0ZWRfX3kYVQJql6E4E
 mlLaroFSa4CGP49QVME8cAfzwKUrOvsnZeyiQUbZPWBMXW+uBK8Y9YgwrrivjIJb7wmDhdReRC7
 qK9USv7TphrUrJV2L06HGNsjdvRqKLYqlTXM7X3b4wkIgOhrHx6B36x4uwVrrN+9tMwZjrUEoLh
 R3EpIwNav7Xufxdb5JgR8pUMcvsFsMXAuXNGn6rB0v/WRsS2RiajjN7nkdMsimfL8qjcYcl2Dh6
 Lbehhq05oF+aSLzbBRY6+VtVAOtUlhTKDAJnf0vJHozYbTTVdSTLpd3hq+b6P0Xcik2Ra7H45z4
 a4z3iKf8u2ZCgMr8Dxz+oU2MdIYHwGm2Ofy2yEwzDjsrMetP/IgNbe0FJUqSbXkNVSL7t7ZhonV
 0ZczkdK7RShuH3F1I/zv7DiXQEuKfXMVX9WEfsB4Og9LQvq8VKC+zjtD4RjqTOKI6Q64Bbr9ca2
 ti0khY+XT+g85/HRAVg==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c34903 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=EhbOz9AlyGEJ4U7p6VAA:9
 a=QEXdDO2ut3YA:10 a=GOxxtejO2lsA:10 a=QYH75iMubAgA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Ysh2HD2i0RP0euvJzhlogxh62z2a3nxt
X-Proofpoint-GUID: Ysh2HD2i0RP0euvJzhlogxh62z2a3nxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250017

On Wed, 25 Mar 2026 at 01:59, Dave Airlie <airlied@gmail.com> wrote:
>
> Can we apply the two follow-up fixes to this from Arnd, this is broken
> now in drm-next.

Done, sorry for the inconvenience.

-- 
With best wishes
Dmitry
