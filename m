Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D83B8D6C
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083821; cv=none; b=nlpoGD7optTVFimxNDBOiJDwV3Tg2q7pidGXu+o1YEpv4Pj20tBI7FVo27QRCHsiBhnZ/UrmRDkKs8iM9FQJLxfKWclQYDZnVfYgjdcslaDrXV02ch7rVRHxFyNLNv7qGlBXgzxHBsT82vM87Jt30vYdaXeQ60UWomtzBFqdUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083821; c=relaxed/simple;
	bh=/snRMPZQUTYia9zyrQ2fRUG6JW5N0Rck4kYn1k73nGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKzi5CK23cjAU6d79U4y+FeynXlhoPMl+LGPiH3wgBnjYstYFYdR83+l2/HvbCQInaC2nT6opWPC7UKlhMiuTBSqHmhL0KlIW/maXFnBA6YcroRa6PS2PwMVe8nJ+mIGGbPGu9ft4bCTgUH7ItB5qDRJkMf96ihTruqpjndAWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGM/QJux; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoXGhLDI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGM/QJux";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoXGhLDI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DAUpGD2229921
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qCV7vtqko2k1ACwoJScUtXw+
	Fbqe1B3WisXDKH89eZY=; b=bGM/QJuxEW9xYxx0wHEdOE+kV/1uGY10QyjRe9zA
	oClU+OPQBrFWbD8Tol+zGmkOBO7gaLfL+IPMpYG+f00QeYNC3stpoEPvDfsdEgJI
	F2NmJTqgKZexklSjLeEq7SqNg5OXSaVM+08wvvCcaJBFuLCxJlruWUbQmM8ONwuw
	egB7nZXm292WNVwMLruvpoAHq8fYNQS9bGKXPpQhzkf9jKpuYC4MZwb468LNbLWl
	bZATIVA0uFUCnJyNHn5tP3boxGgHVBJWzguwcHnOhFmxo5/CLmslxXyJW3q58HnL
	nsJPIXix2gvdnpFQUIj09D+DmfWboQgVjfzkxRmw2vHCag==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt60ert-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:36:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127876be621so3680697c88.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776083818; x=1776688618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCV7vtqko2k1ACwoJScUtXw+Fbqe1B3WisXDKH89eZY=;
        b=NoXGhLDIq4fDrGZRvEMKSNxd1sSl+GXqDex5gyApnrKsfqIPh88tEhCbu54+/Wi27+
         VGrtxM/u5y9AIOK1LJ1TPADvvczfa/8pO6bNedQdyGuIp8rejM0RsgeNx+fmAEdOxLwu
         r2DTvUECKnCsfQklyPcur5GBS7+K1aovNqL1SEeIXzHqm0sNMkGgGQ9wtRuTyDZjsZVI
         nfbYbAzc1I3LTzR9BsKWBEXP4b8WP8DWiHScmIkSyJEf7hHvYDViAiO/lMW8Oz6cBDZ1
         DawlBJ2R2xYTOOHLqwm7Msvso5L9fxO/BddG+yb3DmuZo85JnaB3VaIup1u45VzkL2wV
         m1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083818; x=1776688618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCV7vtqko2k1ACwoJScUtXw+Fbqe1B3WisXDKH89eZY=;
        b=CW8kjejY7yDEZpOGtd3TnilD74cdjpRiTfN9gp8GnHV7k8rRMZb5arWqQWQs7oO4IX
         UXjKAPvUrYszRJg0VHA3piJOH1d0DjaK6p6aEfYK5crf8vkHR/rAJzHv+MI8Ysb0j32N
         RpUwp39GC6eXxHkv208fWhX1tXNFY9MpDidkAYga/PbMHm8hDaUxugZmWiWqesdM7kQ7
         3CCfv7KZne+CThS3rKhiCefu+ZD2HlLe16zHdiZ0h2hMIa25no6jVfAGoZTSz29fbpAf
         T5GR/sOiqdNHdHcnjSg62xtqJXHw8THVjvUvGHitlS5WcLTBOJFH8Yq45Rh40RWKsgyr
         lzmA==
X-Forwarded-Encrypted: i=1; AFNElJ/IgDXrlrEdW2N1pRZ2LgGMKhCqyHmCUCwYWpDUl8hEzF2LT8DRKniwrDGJRrVzejf/1pAfPDM47/iV@vger.kernel.org
X-Gm-Message-State: AOJu0YywAJ8H16donOF8BkTmkfq98CjEPZOd8AMcQMykmV5FZyt61v3z
	zDEKx7hd7T49jB5kP5EStZfMmlfhLYNuw6ln1WagDz9N2Jq8jGYonBVX9crsAhUy5lNzKvXtObO
	+c16bVPdureI2mjEx2nQM3IefTAzMVpZCAxph17NPhBEYw77pGy4S1hu0W6sW5S1l
X-Gm-Gg: AeBDieu7/QPodKKhx5vkAoHJ49VSpAO4xg0/ZB9YESTNNTjtjSuurDw/Pru9lJbL8Cw
	NmMA35s2JOFlDc7mqAxj4BdqrO0EflvdFEHh+hwqglHlZqilE4Xw4GNmJMNcjL5CYuCc006293l
	ctCmkWSlYY+TSSdubY7YRbAFjNYNom9WkXChnllT7ermg8xiOyxtXlH+iWYxVcqrtG7TdXw2icP
	lJ0ekSTIIEsOsdiu71OxhlQHJpCIpWEz/nyofWE9KXhsDFO/UUQHOQ/vmUo34k8DeTbuQtCo/Mk
	2J8GcCHUkES+GuCNsCtcFsBuSK8mXA9A+AM/GxdICrx3LR7aylD1ItXJCdHdtlexq0XpduNEiMm
	OIdvLfB9HaEVSLid2a/wHL71eSDTdADaZZFPS4Q1USdXN7uRiG7nk2ZO16/i6irK3
X-Received: by 2002:a05:7022:4381:b0:12c:8eb:80b9 with SMTP id a92af1059eb24-12c28bfed17mr7513687c88.6.1776083818078;
        Mon, 13 Apr 2026 05:36:58 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:12c:8eb:80b9 with SMTP id a92af1059eb24-12c28bfed17mr7513666c88.6.1776083817555;
        Mon, 13 Apr 2026 05:36:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb031sm13257691c88.13.2026.04.13.05.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:36:57 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:36:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyNCBTYWx0ZWRfX42l7/C4B6W8U
 OT8iQ1TUK6HwfRkSnYDX9Slrk+k456SGBSOLpv+NiEp9yFQ4qaqywx4dERCElXvRHw72O2X0uES
 emcdrlgMtf5u/N758VCfeFyKtuLmQTexFAOJJ0RXyMwPiJKWpE/quaGTviKHsjokJ1uRX4dOJaO
 Tf2gfPL7cRN59zYhM6t6CqTTA5SmlBPaX12ZGlcw4uaBkuA9hMi1eXaTmZDppUSliWI08iH9L6A
 J80Fi+1R9MAl9U2mv/KpUceL1abaJuFJl5ZbQQ1CWunw+2Wzv8/+YuBRXusQti5+iKQM5Pt0zew
 Pqb9IlZwW3GxIchw1BPAohpU98LQF7UgBwVWgshNYVe1P7dspfwzJGcRWeDvQlJBdo0eGRjxJ+d
 LswV2dDxe3VFdYy5F3Vxi4Be3ulQTDqjaBTzzuUTihAWgXI8FT3ldPkK1Zf3SwddOFhEH4S5dDj
 x6+rjmqrB7MLhXx9paQ==
X-Proofpoint-ORIG-GUID: f4soopv6uNXu1qCGhSjr9QPmRnhTetTh
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dce36b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2q5e9KA1SS2KkJZjfoIA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: f4soopv6uNXu1qCGhSjr9QPmRnhTetTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130124

On Mon, Apr 13, 2026 at 12:02:48PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 11:16, Shawn Guo wrote:
> > Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.
> > 
> >   $ cat /proc/cpuinfo
> >   ...
> >   CPU implementer : 0x51
> >   CPU architecture: 8
> >   CPU variant     : 0x5
> >   CPU part        : 0x001
> >   CPU revision    : 4
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> 
> No. I said many times. Bindings come with the user. We don't care what
> is in cpuinfo of some non-upstream board (and lack of user means it is
> non-upstream currently).

I was not aware of this requirement, and I see many bindings that
currently do not have any in-tree users, e.g. qcom,oryon-2-3 in cpus.yaml.

> Please organize your patchset correctly.

Are you asking for a big series that consists of all the new bindings
used by Nord DTS and DTS itself?  Unless this big series gets applied as
one-go, there are still chances that bindings get into a kernel release
without any users, e.g. subsystem maintainers pick up bindgins being
reviewed, but DTS requires more iterations and thus misses the release.

Shawn
