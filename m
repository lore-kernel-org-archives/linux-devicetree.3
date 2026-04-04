Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A950C189BB6
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 00:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261065; cv=pass; b=mOk8cTZfbIRNa6tRUvSs96DJHAANhk/1WiEhPWGZ4JkrL5MZb8ux50M+xQifbL+cVkslh+rx1/JXqhw1X3LhBLOe8IdtbGZGO49w1UE+Z/04uDKtScqcQmqKEC3B6CRL1jpQkbm4ySxaYe/HlIV2Nwyjm0hOC9N8yP3//CrDBmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261065; c=relaxed/simple;
	bh=bMqGxuMveB8N/Dnc0BM4cz72pAu4ebVe5GE38KXtUWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+/14G0qHMUvTWTW2aSKI5WFDqSmvwlYWmx8K9I2NTJ+5yvbX5Z9G1d381dLdeQplFGLd65iKamTa8YfrdF9nbMUyWKj8iSR2LQ9zpeCsOQDuPRwRH15Vpgi3vUN9CNHCJohkeKhI2HWyb1yuCa5GjcvEifQ+MTQSWoD6gkPmmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8N0QcZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bdf0SyQ9; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8N0QcZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdf0SyQ9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FuxJD258422
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 00:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mVBhn/j5Zs87fQ99Bokk2uut
	cUriWDK6vQARo+vqRZA=; b=C8N0QcZKfCGryNLnc5Kq2sr6nIkkbjtShCuOsa1Q
	94ZkT3IMd9eJxIsU465A23791xIA4BIVlAsDqAkiYS4rJd8ru/oY6k8vP1u9x6w/
	R9gCVYKQlnluvk6WW3rjAVUYjx2xzvHUArKCYpmF7hK5s54yvOqlMM68Q32+FlIi
	ZtPIvKHssH7+8GULrBWjSMNSjKxFvKWlff1piSgHd+tuSPsEib9j62P03yK3WPCW
	/qxFDsp87u8/96OUWNzb5dPjsiFWXvW71LVXso03x4FzhBH2iN2ZHoZFrwfOcqHK
	OIj7B+omz2AfkS9YPwP7xC0MO1c5d8SZR4R+mG5ZIriyhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn213mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 00:04:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2489af602so21956965ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 17:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775261058; cv=none;
        d=google.com; s=arc-20240605;
        b=HwgTzvEnfAZxjP62isPddHizYqzDThdARKxL6UJf05JYyQP4qXZjMsRTY4zTlhcBk3
         sT0WJVwXLchM97axnl2X3w0N1qeVC9EKvr94Ft+e9YoOWrp6Tdqzf20Zp6dN7ZppkCtM
         lECYU4ee+6Crtz+ss0vq7wfqi6dV6o6Ws7skOCx6abwvrzmpEgBaFTvClMzeWh7xTgSu
         KO80007wuhjsbKmSlH2yH2wLTFMkPEcRGarpLFiQ845K6N0ath+gao1PrPGOHPr4nk0J
         +v0Sg8UDXMI9uYZFn0uojQhlNg6etYpbUak7w04H5wG3H6FLS+XJNhToAsMNptjyUWur
         fSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        fh=NL8UFhBySFXKei7B4d6rncu7GyDTL7LtdUclY0kG30k=;
        b=jnk4dir1YS66MvgBZwmuwsjEAQnQpzY67khD81KLjRBjUUGv7qGZLvYtNQeF0OHncH
         K1oeG4+jig7McoVQhFWIVrSXEo9Lt7H+8KqPjdJrW0WP44mfjyC1wGphmwhnkd75GKIn
         iG3C68Z/f2DOAU2HHkzL14hAk+z46mhOPL9eUCF+ynt3IcpX+WGkg/1LpoNhKmPwyBeZ
         2JnPMFfbyYg+CxDdLeVST0Cw0e6gCDmAFBb12ksjmLrC9xHcOja9RbelEbfKCbaP3RVb
         uPgGoHDnQZvQhOOYh5bCz3kZmxzZBmLQFPqj7CkyVp6d4I/m4y35R+X5xNyKSgDNXcbO
         AUPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775261058; x=1775865858; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        b=Bdf0SyQ9MCQ7nmJZhdYt0+siCzt6UaXOJle4UzLA2MJlkPabow5/huroo48Q7tvutV
         gx8kjYhoB66+lDH2N0iIeBX/jafFYxpMvtBCxSlze5vKUNa+gX5WdIYos7nLwyDDQDSo
         IiJWb9hH4m8yRFpTijIGyS0seaIYTAaQKi1We0Nq55UeA8DWE77ELr6/hSqsIhKIGDaZ
         tUZbTbMvnENBNfaD59kub/zx/7OWM047kGqjBuyH10FT8c0lMgdIJ2EBjA/nH2v3GpD3
         P8R+cNPmeQbj91wtUBKXBJSrXEjF2DNmVnTKAEcKbsZhE2in8ss/F2KXZ3REy1IxRvNu
         5/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261058; x=1775865858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        b=Rfu050H1TpxkoLVOT9+j2WV5iepLa8B6RusYpm9dWeSLti2jis39E6dG2nQ6sCT8E+
         sJnkdQw63Iy4zJSaHcMDyYJT+sZxY9GiGa0617UIrb/iAL+w9Sm6U3r1WdEwaD8Ov5+x
         FdjG03AO6HszV2rfUTR0yvLYkdPaWd6cNjobiIgZo8W/wFMNBXbQ8K4ys2cDyxg/Aob+
         EGx7h7F+4MrB0wQaWcW5on+WIufhFzr1YwDscaFqDGp5nKs+JtHjZa7i3c8algKksfSr
         sdgrHwtzi6PFm7tmFG4yD3/cQCL5RrNqKhaxhyoLkWmtlb7ExHCdN6OnubBz3f/Km4Y4
         adjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB1COn3y4ej770p1yS1dZ4ecoAvoAF47AWMsuJfRrUgVty66+U5y8GTs94WzJkl5z+o7mM6ehRr8rH@vger.kernel.org
X-Gm-Message-State: AOJu0YykfcI+ePegaM4xpij1TsTOIXba7ARxzx9aXLkGnSygZH8nJ3Wo
	DjdsH8d+JPsYwsdWNTJCJSJrqMcoX3nDgIJ0rJk3M7CpJIL9KsvBt06anioFVEndU3n/fd2LZjO
	TqYQMZ1Z6XR626iPHEXYG5H35mKDSLGhYVnPjp2oW6xXJ6dn+Q1ph2/0gSq5rMrOerdyXF4lqMw
	4bPl5dWly1L2oNvbQURnKdKv5aQl9XyomR30Lbzg8=
X-Gm-Gg: AeBDieu6JMUZaDN0ljfdDNRNg6pKN6m8N2qcsT6uPEm7D1rWH2jbxIKJehNXnijhzX/
	2AHWaj9G18+gLT19jv+LRliM9KpLlf2ByuKVjh3bjLN46xSFORJK1gnqNTLS24eGZYQvolPigjL
	2HnBCXrA33W09/KmGvrfn9RZjBklPUIAesNdGMEe7Bcm+Aw7jLb35cSLTyeKdY+u17mkfiRTJ+l
	rbZmvA=
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr72789915ad.14.1775261058093;
        Fri, 03 Apr 2026 17:04:18 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id
 d9443c01a7336-2b277e36491mr72789565ad.14.1775261057567; Fri, 03 Apr 2026
 17:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com> <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
 <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
In-Reply-To: <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 03:04:05 +0300
X-Gm-Features: AQROBzCHfiSEFgykc--8quwVwkz3slXjV5fcPMrhEohl8fqeroSmIXA1wvDwueo
Message-ID: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
Subject: Re: media: iris: enable SM8350 and SC8280XP support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Steev Klimaszewski <threeway@gmail.com>, vikash.garodia@oss.qualcomm.com,
        abhinav.kumar@linux.dev, andersson@kernel.org, bod@kernel.org,
        conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
        dikshita.agarwal@oss.qualcomm.com, johan+linaro@kernel.org,
        konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDIxNiBTYWx0ZWRfX8sYexNJiBHmA
 144nhL1FSzQohWMZ6HQc6JbS/zkeQo77rOYNwCMqgoqNfGoykBgysIzzymxZjU2P3qO2wCELXU3
 xVHgJTEdK12hUWxLk6YxC7nRt+YD2vvi/22SWCCmtd7mY4lVryPkVgm2yFir+rOvKSHEEe0CxMI
 aVvYf9fd2Jxrgu2KEXti8dRWn9WT0DlL3sV/d9B5AL6gFH3u95OLj971kkd9VHzzFaLXq6X+mwF
 RGW3J/RA+b/ycgN3eZDS6C4+ykHv+FcVT5yBP/PnH7IBiu1oEuco90W9i4C3S2xIxhvo1Qz9PAW
 dflulXAFbWOkUaZQufbpPQamcalTeH+TIQIlaRcuQW5g9My0lp4qfs8jylYMaulcMGXLlAL6eLJ
 CVJidH3wyZ3Czn3xcds1Ov58DC6DukQZ+3rMwBQKbNOe/guWRkckU523gX4twj/aR/JVWYf3Yjt
 RJHXP0gj4PS1vO5u5Xw==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d05583 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=n3mMJPqUfPv-MVqFI_IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: T2kSED__3F7KaxWfsA2NtX3k_YAp2DzA
X-Proofpoint-ORIG-GUID: T2kSED__3F7KaxWfsA2NtX3k_YAp2DzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030216

On Sat, 4 Apr 2026 at 03:00, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/04/2026 22:59, Dmitry Baryshkov wrote:
> > On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
> >> Hi Vikash,
> >>
> >>>> This is not just with totem, showtime shows the same issue.  If I let the video
> >>>> play, it plays just fine, however, if I attempt to skip forward, back, or even
> >>>> play*after* the video has played, then I see the smmu fault
> >>>>
> >>>>    arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> >>> please log the info about which "iova=0xd51e3e00" buffer is faulting in
> >>> this case
> >> I will include the diff that I applied against my kernel, in case this isn't the
> >> correct information, but I get the following output in EL2:
> >
> > But these logs don't capture, which buffers are causing the IOMMU error.
>
> I'd be interested to see if we can run this test on venus - instead of iris.

At least when I tried testing it, venus wouldn't even boot the
firmware on SC8280XP, citing UC_REGION error:

2026-04-03T01:51:05.376407+03:00 rohan kernel: qcom-venus
aa00000.video-codec: non legacy binding
2026-04-03T01:51:05.437232+03:00 rohan kernel: qcom-venus
aa00000.video-codec: invalid setting for UC_REGION
2026-04-03T01:51:05.437838+03:00 rohan kernel: qcom-venus
aa00000.video-codec: failed to reset venus core
2026-04-03T01:51:05.437850+03:00 rohan kernel: qcom-venus
aa00000.video-codec: probe with driver qcom-venus failed with error
-22


>
> Konrad's patches are still floating around somewhere.

I think it was captured by Steev:

> This is much better than the previous venus patchset where accessing the
> hardware decoding would cause the machine to hard reset at least!

-- 
With best wishes
Dmitry
