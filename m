Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34D1AC45D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526362; cv=none; b=KptZC1lL0UE/acakmcO+BAX7NsR02VAGu4XdwFWJPcUtOX05wkWFGvBCtDw0m4GzA3uQJxdSFMH4cvNBhpLq7qbRYorGIJmD2rlT7PsqXzmfcQyK0VC6qsVZDxKvxH2/9Q+jZL0P1Gaoty3X21l5NYCH8w10VhxEhfivD9ys4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526362; c=relaxed/simple;
	bh=g+o5GorNkv8qi9qYCJmUtBjISmcF/Ttgm40UCw9Aams=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cq8fqtfeW1IHHH4GYpnitFmo0HcPeUTJnvx245WhK/N4PgYh1A+4Nz2RR8mVufsIbfLoonCkZ8gPL2SxEeDPPpZPqKw0tjWNASh7xRemipcgUNAE8OLIUS8/CcF9h1zzQlq9++Ha4tbiol2WS6EhLLzn1O735RX1vmH1C70ka0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rxe0ZcDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTpErgso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rxe0ZcDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTpErgso"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HMH21089425
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 06:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=; b=Rxe0ZcDEYe0hX30i
	Mht6EdKU59lRhEleUm3WrCPHGk+ibhZsIC2cssPY2tP0QAcQTIZNyiZNUeV6V6Oj
	IjBgXEy2PBiV+sT9bgmpo1NnA4FbbaqnAsSzg/27XGiUx+HTibWFz1lQXr+S16rV
	1XiDYYk6d/7DtSWKCIaBoykEJFWCoPLDTfCjVyy7GB467ED7bZzdVGgn/JhgI9Hc
	ZKHZ17CWJ2orPi0OGgEfuQMfKTCQ0pkrxb6qisBh6dcntGv/hN4B/UFjA8ZcR7QD
	V+YU/OzQfSkxdoFbZFPx2dDA7w6k0oTgofHTW2t8+qs/n4263cr+U3RvH5hUgJId
	iexd5A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvagk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:12:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso9038743c88.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526360; x=1792131160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=;
        b=CTpErgso7smKUWwjSo1IVIhNoKYNjWXiHUWoWRp14eWkoDaFt/A/Ehn20MPKPfUW2T
         IFwb1Nk5VDsyW/2IAgm2ZjzvzVLzE1kUFFNyi7HrVG3B6e46Vxdg1oaIwKw6qQ9zleJQ
         AKfyFkny2NiQ9nzL4tR6qcn7HLLpKc7C76kNPfqPgptCSmCvstWV4YB2oJaPXndmnAsq
         JqViiadp5DK5afquTMfQiuurd8jQQd2B5fUa35qoQlwQD4YLz1q59RhqCDnTwegpdKXA
         Xche88U+HmWeS4vWVn0VBv6Qtc0S8KDx9IJOQx5Jks8VPIrUHFKL0tf/qyVLLKrLSxdI
         C0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526360; x=1792131160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=;
        b=U3sthtNdzc1zr1PT8JB1XOtyrM5pBCK9cG3oQ8C645pRcEGvmviilKrrN57EBUebHK
         5i5mi5dwcBJNEeYAtbxJJ4yVA38JU64i7aUA2Pxk935S/a+pkwsSldnWetDVWPuc9Mxx
         2yV9F8zWgiOL4ZHComyVKDxV7n4CmK9c1ELyi4jJwwLZglykgjEPsjDZBRGO9GRvx2/h
         rqkxwXcRp31p6lwrj1EAh9yJYLAk0c8gbgkX+O3db39GB1NQdLdm+xEIcYFtaYnT7g2f
         /gQlrWFebHjzmTI6tcQnQPLjDuRnm+VHu00b9s0kGkJJUJjPSInN+IBXG2IU7mAlYsUZ
         +05g==
X-Forwarded-Encrypted: i=1; AKwUvBy/mRKCr4th0xePFSTO891jvdyTOMelfHBjXFtwp1IcnDSZxVz5hSxHOy/1on5GUJ+gls8ooCI68vbP@vger.kernel.org
X-Gm-Message-State: AFuF++nb0QKzfnio1ub/fKWp0mxnqhrrWLxFqa6z/AqCB54+cBVT4Xzk
	tdWtTTJj4LL22UbKrVUyA/1FT9dX3T8ZXk8IEb9rxqvfpTPdqDEViIo+b3Gr3XCHNoCF29fOm+3
	wVgRxif3SjXBsXy9Um56zkqYgDyts+flw52Mkkmj8oXARdfs7F/mQtziQoa/nVYLT
X-Gm-Gg: AYBFou2bgrZJZpd/4N34ZnZFFceT8Bt0vT8c43J22mwk+de3QuAlX8IGFTOjzVvgjno
	NP7SlrZ9Yf2BuuK+oqdyBYgPnpVahe2ClUEgSJHvoMKPKzC2wqdZwnejt6l5VxPuroOqcoiVrUF
	8XSlUkxwXd529j7WdU2Tjjtt/rq3TZdaHoWvHwKWWfwmok4D9tV+cqL6ewBLoX/wC7LF30pMx/r
	nU2kebFLehRHSvSSqM4omSGy3Xvv+MpT9C3ffB3poqTbxI6Vy/Y3Bmarbn7goPgElmp0wxR8BCO
	LxHRMwP/68y+oAh688FLjlj6raJw2AuzMa1cKs+udLmwmDR2pekWdFinBOgCjSKODxoaahMzxI8
	j+22mvCh5Am6moTKQVfQH9nEc+7bx
X-Received: by 2002:a05:7022:f50c:b0:151:2e62:fe54 with SMTP id a92af1059eb24-16a5ef287a7mr1102554c88.20.1791526359496;
        Thu, 08 Oct 2026 23:12:39 -0700 (PDT)
X-Received: by 2002:a05:7022:f50c:b0:151:2e62:fe54 with SMTP id a92af1059eb24-16a5ef287a7mr1102534c88.20.1791526358938;
        Thu, 08 Oct 2026 23:12:38 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm3562167c88.14.2026.10.08.23.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:12:38 -0700 (PDT)
Message-ID: <5022011a-c239-43f3-b8b5-73d6b5fa8e0f@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:42:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gwwMVW34Nhl4-Tpl-z8tYqzCslMMtHRE
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac885d8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KkVOY3T2wTLdEB6rIlQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfXyVtEQOn59W5V
 NQIKIhBi8Lz1M7sxC2ciysf8+Bw3QUAH3OCBcN3KNeThoXaa6haDdFxrXVyKW+VHrAMC+r83MIx
 4j+hSZpKlV9wEfMyItbCna2cXCg20boRiA5/7elYehCpLudDPAEWZOqXlQYIWCjnW1pqueDPDl9
 koaFtUQa/XQ+Y62YBd5RkTR+Fe2AVYEbXQbMEYKmh118fqxCfDBfsIaCJjF1FoG6JBnMaaCbu0F
 JRKES7k7IHEPtotbN2IfETI0fdUJseQOEGVsX1StM4nimUgTHMT6CBIWWBIyiLFTra5lZV+kmdn
 bNF+fOX6BLyukvmmuChJtXYX56nI/JEZ5A8B/IXtrf1fzHAGa/TYOh7mJDf5+8LoMkQ42hZMRJi
 Z+mjrheazq7YQycWxXl4z4VnXc9Lce/Itega1rk95uXxs7s/3mH0rTV7twMpM0fVAm0qY4+Xwty
 gk5LRS/FwBP2O1qXvcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX9khKeN8QDTpM
 qXfDHP8OQ/kI4adimqKr4mrqeOwN86jnoyGHgQF2YN79PIfn27FGBZsHWke8K7XpZi27+hMb91Q
 0CzwRF9mxNczsSbK0Ishi92Mh3raNnA=
X-Proofpoint-GUID: gwwMVW34Nhl4-Tpl-z8tYqzCslMMtHRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090024

On 23-09-2026 14:09, Vinayak Katoch wrote:
> The qcom,nsessions property was used to duplicate FastRPC sessions
> inline during context bank initialisation. Session duplication is now
> handled at the driver level, making this DT property redundant. Mark
> it deprecated.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
