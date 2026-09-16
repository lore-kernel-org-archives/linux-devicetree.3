Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8745C6F7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548018; cv=none; b=C15DI5VlvPJAgrsdxRXxe3hgy7gSwAJDXd0Gjm1UhRo9OnXLGoEwpor4WWgZ+aHFhPfuPBWHE9a7Ib7EOOzOnQdBdrn7Mfxlg3k4rGMMbd6oyKZZnO0Zif2pMyUN/vjnHCVAl2gFvtzUyE90aR4XtRr8AGTNwc1UFP9a4W14fWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548018; c=relaxed/simple;
	bh=V+uPST908ARcUPbXsZ044ImTTxG4hdUNF6WNYVa1khE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRKdR3Okl+r0q/npqc9BxnIZABBeTsoCZNUYCw0VdlhmjcQTxO+SdNENO9FLd7/M+KN6HAUDTKev+XBrcIqZn6t7f2PzX1DEPCZhjIT5cPrB2lzZLSUcbU1LKCEWwdnya+A1LFB2e6G3E5q8luHYxSxexfJu6ZPO4yZ7BUfH2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzkOeRvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kczu56EZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzkOeRvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kczu56EZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69PBS1192514
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=; b=CzkOeRvKZ/Il1fGq
	PfgHu7bAoFRYlU1hcVGhiYp7ou5rH95zbeILnNuLzAZ0QL17PL50zJ0rRoRDmuTO
	wvwj0tQAdSLdRUmvQv4zGDY0jN+IKXAG+IGqnIJAoGuF0p+bhKkPYHZlwSiNq+1C
	lusrNWf3kL86da9h/kfq0hPAEt4OTzG1angAnV79j4oyKJteoAXN1K1L2Mn8Oo0L
	K72y0qnEVR4TMpHBh6Ic8ja2i/8zJaXnjoQMclW/F5nuBl5b+TxZdWVIKthwdv/s
	7VyO28k3JswSvm1+GusSnyaphy+uFf32epbGhoOIHhL2tPLD8lolBbckzeAUoO65
	4DQsMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageka5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:40:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso646588285a.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789548015; x=1790152815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=kczu56EZ1DKgqEDxpVsRaTfFxXcJFfj/eknvS02JjrqILwrzrry5s0KifMrTv0p+wM
         QJyVQEEh9ROOACEXFCuBhYnImVD3Ru208Lw+5nD8uPgsw4NzEs14U1JNbpBT024nX2fY
         DmRk5FuXnBGYL80XAGHtXDTkKB6RlCnGhUPwHFC6bWnxxU9C4usPUKAxpIJTF3t+Tr6C
         Wk0mMSjcb4mM0Mg983EwM4PuCXsAgrXy9WYV40MCFyuF8pWpMKe3iFZsksL8bJJKlT3T
         xo93zyQsE/oVADZ5BPMxW8NLRTFaBWg4v9xcpRRRWYaNOHzUjPfvDKcAvQhM72dtYgTI
         v8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548015; x=1790152815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=PzsWu2nde6b+JT2S5weQ8c3s8aj/aK00j/VJU1kUgcuTAaup8mmnV9fhou3L43ftlL
         PBhL44YaEYo93o7e9AbCPqQQMyOQzHmb3SIeGhswhVOpw7UOuHWXG8CNIoHKHGrQIduq
         Ou2LITOkgubJP1HOnvuxDUt7M2KLO0YQ2b97/c8LudtFN9PrvAa8Sb3v/7zD2+9ecC+B
         wWUWSYAp7hewt1msdU1hkZOQ3VCsGvM09LK2dIJYhStBsgtvd+7mvFzH8keTD5crZTKm
         +ZACEjj3YMhl58T4uJ4hcYn02BtuEOQBUMpvfM6pnczcuHC33qTyBV5nkq6mCC0yAhoJ
         LxeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Xjbm+lv5TQtWd8O2H4dQA6ri/Dki9gpquw4iBi1NHIOkdmnz/Z3fdj/JQGapRLuQl+p7NBNhclnh@vger.kernel.org
X-Gm-Message-State: AFuF++khcUXzDU1nqX9XrEFrrbvylLer2ozmJtd/A0R6yJU4PV64Vt9c
	FOkquOSINVh8RSiwxiSls4lpV/KhVSCSlaWWgnETTH5eVMKzjeY0ngFdOne+4ovtudsAwNYvQBE
	wtKsso24nJl8KmxN4F7a8XFqsdUHOInGOaVQBp7bZkjoiSTLWTehxzWg27oSbAVAk
X-Gm-Gg: AYBFou2jYjVSg9QRB0erv6qMUTegkp9iPsUSOE/aq3OGHsGyXNpzRvp0EH7DNuNaS/p
	EW9WMPw9A5P1sZB97DzUjHi/Ihjd1N4BIHh8YNEkvdNEaYMmpNwM541M42l9KFPK1Ti5nGfcimg
	7ztIAmStYO30jY9SsCWBbf7jX8rhr3QpZ73Ea7iQxtKTad6Qf8RIxWUbMfYhIrufrfCI/qmjH6g
	Xm3HR+IExKWA0KTho6vhSRHgAuO025/7QtRotQaR8gIGFMgj77hGyKYhqGcZTpHsdPNBtjJsgCL
	XKzercL9pAht6a9xteReEZMu8hWpQHcL2u6JqP19fr2ed06SC0JJOBbaWb+2u9Nhz2qvt9cBloM
	bm4Rkyg+RtWZ5/GevITTYcB4FOIc=
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246029685a.19.1789548015003;
        Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246027385a.19.1789548014553;
        Wed, 16 Sep 2026 01:40:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d906d8sm73865635e9.5.2026.09.16.01.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:40:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
        Michal Simek <michal.simek@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add parsing of hogs
Date: Wed, 16 Sep 2026 10:40:10 +0200
Message-ID: <178954800853.4594.8595812335240808989.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
References: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfX83DvHMpK67ak
 HK3SWZoPHVesQMKYmb6AbU7MJUzpB7Uh8vNO2YTFqyUfOFgJtyqTqO94n4TvdBJBw/0FFPk9bSP
 RaETbBdHX0teLK4BI5OuyRRO67+hxR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfX92V387p7SweL
 GIQ5FtJqDAXfLmoPIAAMfx+eXePHDJldZz0vi2fl2P53xCTOWJRdaj+DbQiKku3gAff6W2qUYTW
 8PgnqWN/kndMQU9qu9UFDDs0/5ANmqbH2IvsLoO2z9kRZzB8dWhuESD/81ZQj5M5CgYbaCRVrr4
 RhF26ADoqYlk2vc6hRTiZKd5Dz8jc340GXa4zHOegsWZwM9fDDlNhlRbi7nx0hURorCOYzGIfON
 F/pXLVkkk2VIoESkAaKjdjK+29FdXENJVurYLEJcXCeQE6+RSJgNz01QUGb5vxY+UMdqvc74XN4
 JEAq7qZY0LEOQvybnU2bmZlsbXIfCz+3P9Ubr34PAZjFVuXCOooSmcSrkqJOl+9IYL8j1XcnnYu
 AZvtt8iYl+1Yju+5vh7C5uNEwgBcGfgHzECKu717/KZ9UpxUHZTpyD9JjgEC+RjpT0F8tXVT8SC
 3HRZQjZ0WidmkTXlpAw==
X-Proofpoint-GUID: kFKGC5cUQD86KBrb-vZqI4ISzt9X6-pe
X-Proofpoint-ORIG-GUID: kFKGC5cUQD86KBrb-vZqI4ISzt9X6-pe
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa55ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UEueuJH-RofihTD06CQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160112


On Mon, 14 Sep 2026 10:51:54 +0200, Michal Simek wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs the same way
> it is done by commit 545908a9fb9c ("dt-bindings: gpio-mmio: Support
> hogs") and commit e8f2ca6be61f ("dt-bindings: gpio: ast2400-gpio: Add
> hogs parsing").
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: zynq: Add parsing of hogs
      https://git.kernel.org/brgl/c/4bfe5b08a5912d1720689b1fc7f46c9b8641997d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
