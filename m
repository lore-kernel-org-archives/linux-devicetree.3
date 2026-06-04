Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9633066D
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589016; cv=none; b=H894fFeS/jKSKVZ9gBXQUDwIMCGZ+8vRguCAQu8xiZYiwU4YAaa8jv7Pb6/lodUD4OV2vP5lZvMvv2VHZIj2txvL2c21qocWiYn87Pv+CpQwdTmtJrtXKvMx2OqsYznG2k685MdDg5nnkpveyXn/g9t73H+wvBTuDGFCghOSxbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589016; c=relaxed/simple;
	bh=Mpc15BTxXFPLS7siOrt94DVTxzgWbPGCx4J/ojX1QSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSepAESagvAyMqxidh35w7fWSvFRXKDkPnIWnpd2hDUVfObjBXr4agtVJbGj+prUvYUstum0pp/ajRuqk9OdpgscyF8B2yoqr/s21Y8gwvW23XtDqs9vYqFAX/O1oIFNLvk70SLrRhrDaNoTyhJJPDMXNeQqB4WOQJEsNmZjJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R57WYhlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOeL8VXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R57WYhlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOeL8VXl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EJHCi140659
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 16:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8T3I1JSi6bPzTWMglkCJmeKM
	pAKkFgJd3nlCAFBxxjI=; b=R57WYhlKJl3K8bFUdl58ZqjkhTtCV46ZT5QO6j0A
	Kddjcmp6YEGcd8WIruVAt0ZMvC+hOWwkGsLEYz7Yb32W3tRSjhQMXgZc94DdG/6u
	YU3sFnnQtRqKdtqQjus9VHxy5Ee7e1r+jsPLX0pbfzq5ydcL/dpmaF0z9cdGphrJ
	/WYa44pwTb1IiQegKIZ9sqhZSST8w2Iiz/tW0BAkpcmqQsPp61iSH/YrPG4o0pxF
	PHXOOSiUGCCBEuyEbblKvDPdgi5d/iDCJwe1OMDiZjxZ7Cg1LrZfd6m3m8FpJylJ
	7poDjZlZipbJF3WIo4ECfDqr2LrUdd2XCKi/I3p96YyXYw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenban0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 16:03:34 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7dd0a103a3dso17865027b3.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589014; x=1781193814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=JOeL8VXlIA/2CtAHOsaQb/KuOIPZBPQHcWY9C4X6PC9LVwTZrBiU+HRiNqBInxcQ6a
         eme6yM+me2WYvuGLta2IBMyLVZui+dChgPf6AQKWDTeGWW8BEt6G3L1FTY6meolmcGu7
         qqvOov6Ns2b1/XTysC7ovCqiiASCGoqH74TaaARYAo+zbWDgkyn9xwTOY8pALjrZwXn8
         DgwxrvaCSrTdZF7N5SOgGGeTfP8iqPQG9ujFzbVw0+xzLxEcEpIWKWZMpaWm0T28VVk0
         cQdnVcMEF0LzBED10t6FlgL5A1QfD52yw+eOt6doK7P3/suOAwpGvgtNq/BimsfMXobK
         8yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589014; x=1781193814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=d7BADGfsuh4QIYq9Pbq/sFDzIrJpaNkQ79z4Z9Kf9HTBqGvjzcqMRQo08Df39o8XsG
         0XtcpqaP4IrfVlbPl6WUYlPrD/LrRWbmQ/aI+zQn1BU/lhWnxRgnipjbAypEOQtakzyE
         Q80+tq5GaXnyhpI9KFubDfX/rEmXX4jnJRv4tfV4Gnw7R6vuFPhlULV8j/3/RWqq1q15
         JS6QPypY+o63qxRWAeWbZdvDfVdIuK16QabXFgFggeumZb+NLVXtc8IFdO7mNeT+bei+
         Vy2KH39z3iJjE3IK18Us7kEB0bAoh/4IN4uCdW6MS1PUV6UjTT/ABdnVY6pNES9rI7Dv
         Rumw==
X-Forwarded-Encrypted: i=1; AFNElJ+MTstyztn1fbF/Ny9ArvlwAfDQmvCD1Xb1Z+ZF0KbLUVmjPT1jwIH9QA/7b9h4XvU9/8ETQSw0ycKq@vger.kernel.org
X-Gm-Message-State: AOJu0YwceFk85iuGShEqzMwVwaClSY77eT1HwzvW0woWVvye1x4cFMUE
	FP+gWfxY+noXu9Hw91UsrasqF0LXgUzGji5l600SWnLffLXlRUlpEVdU+0Om6wUrjHx+bnKsuNY
	4sXDmiozjzIchcqB4sAIXPUDsnEI8LkYZmYa6NzFhgKbjLl9SdxZiPmIm/Dh0tDwugH+W8uxI
X-Gm-Gg: Acq92OHRnr+MOS2wZ5UU6bq0modeoP/H+qJJ/jXe8477/gEPr1uqF+/6jmve1Ne9vsV
	tBsFQeWUdvFLPUtIsh3Tr7EM6RjZGY4p4vlFYOJ4jxnLKojfTeQN0qIrPICLJStWkYdjp+Iteqh
	dPycByy2M4ziVFmGDjiJ3FD1w90mvQuPqUOWBClHK9FgakZX8XwA6wgdAQiZudndTrrUs29EYe2
	34SYFEySanFc7JfwvWQY+1NNSAkV8npy1bbvyDnlkFodGoSMBsoxfiLjX6R9HR1F0JuWinMdeBX
	xh99gZkiSPFM5NSE93pwu8T8cK8Xs7dkfSJMd69+WJjUKptY4senIuW19PzKsLD3Yu01zd2WVLs
	4bI8KVqo6sQoFqQ+23IgKx2brKO/RSb6pjKRKVtxeOA==
X-Received: by 2002:a05:690c:d82:b0:7d0:354c:6594 with SMTP id 00721157ae682-7ea49d67854mr84432737b3.33.1780589013316;
        Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:304:4f23:4466 with SMTP id 5a478bee46e88-3074faa488dmr4046204eec.15.1780589001468;
        Thu, 04 Jun 2026 09:03:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm6911110eec.6.2026.06.04.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:03:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:03:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Message-ID: <dyafwgy6wgahizpld2vfuk56nzhueh727u6vzblmasmw24vb23@uw46cc5sxpb2>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a21a1d6 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bmEhWVV90QwrJAxICpMA:9 a=CjuIK1q_8ugA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: COwL_ipKdiBWR9_NvqfeuEcYRPVx-Qkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX4vCvOTKnbaZW
 nFOWbaHawo2KrSpYOc8KUfbIYxP9UX/Pl5+q8rasEFWzABc/UGm9K/iqiZMV7AqsF7CrzeTh68l
 4+L+ImkjxQpLZ2En1XXMI7qhPNcwyt9Pcs82sISMqGu8Fn0DSDVB50Akidnviq4TwwG1gOFRhsW
 FBDR6YcvpuwjtrjIGWMTasz5nWm6m1Mu2MpMTNNASMWhWlNhcMW4qoqUvLa1AZjHunFFofHtiwJ
 Tz69gA+6eKV1474K3dSw1LuYUppZL5lWuzdC1ZbSlhng0SPLSR+nnEFvFcUse6PUmfbWFpO+8dE
 ycGqkKUzcpPMdCLHFpPMg1LWtNOZiQ1L/OyZHrKfV5m2u3wtjsf2Wd41YHhN8ce/J33l0+885CG
 kl0eaou6HDRm3qUC6z89LQKfB/VsvIH9DJPMMqrsLr5oK2jC0BD8Fqtj9vKB4pfSSJjbnCFJMk1
 MEm4fWncLcYivwySGjA==
X-Proofpoint-GUID: COwL_ipKdiBWR9_NvqfeuEcYRPVx-Qkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040157

On Wed, Jun 03, 2026 at 07:11:55AM -0400, Guodong Xu wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets
> userspace check for RVA23U64 conformance in one call, instead of
> walking hwprobe + prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class
> bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
> init time, and surfaces the result through both /proc/cpuinfo and
> hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
> detection, to riscv_set_isa_bases() without changes to the
> surrounding code.
>

Hi Guodong,

The series looks good to me. Thanks a lot for picking up this work!

drew
