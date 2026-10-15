Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D66348A2DF
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062115; cv=none; b=ixIFlsFWpxSvX237PT3txZbLaF07PlyGc5//pnBXW0DZfiI23fBhzUR5xs33H+SHAkEblog9cdH7TbYWtpoZsSA02OwJHCAJafRcIZ9Pr/LdUWxtJ46KEJxFyD2GilFSBWfrfiy189vQwKqqWO+KNlzChkZiLbj81mpmkQo6zZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062115; c=relaxed/simple;
	bh=YZHvAvN59dgFZAlMz5AbtDARiD9t1W2atA1nr6unSmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YN+NwqpQ2xzSs7dST0y8kJf9m+SfP+dBqQgvFwGjOTzaHO2S3GMCiauMOwGgzdBSJ0lvJE/xS0FeId/57NxvJWwBW1XxE1gDbVxoCyXqE9Ls1h3UBqkX4UAREtPdc0XQTlEcxbo+Ocxp493lCx98aX48gll2pBxA88AeTAWf49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inF0ZugA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihWf3FDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inF0ZugA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihWf3FDl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jahJ2966458
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=; b=inF0ZugABga5RGmA
	b4Qmke4FwoUfC+XVIxjurdcCzGSwf7QhxL/3X/Ioly/djFzk0nhIQHb4Vul+Bzr9
	oKIyB85mItCzTHLhoc51NT2JpOe6U4FnVWnscSY11P3JrVqryr6SUd1TPFmCV3LI
	NAywbpMr2Y9Yi/pkxRtj09QDipYT9qmeuxdLItPklwLAGEkZhBHddg3OSxsUE1Cc
	A5gIOd9mVNx33EY0dBBx49uzOsg5Jj9Upbtm5U/Mpr5NwZZnoEreL3sTXEsO+eZ8
	OC0B9fMOnSPZN+WxRmddZxYMglydLK3pBW6PcKQTja9aQCNZOnyxP3E1/mzzTr6y
	8GPRVQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wupqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:01:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5d44237e2faso265364e0c.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062110; x=1792666910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=;
        b=ihWf3FDljHuX6TaPMgujKLxzGaabVzRbT7DaWNgna8aeSSDspiNy7gG+6eonb+AGJI
         dQHMnGWdJJ6+SuPhFyaEJYb6YevMSrZlmxdP3w3Vf2wXz/14lT5WQ0JBe7dP7s7CxmZY
         k3dO7HCFkKKEBBeZeAAMaZADOu9ijt5mAnPJ/7ZEOWnrn4T/DQbmg4djNG6I8SAtGmaX
         nQCAqB+Rard//hJHg2WhjLqWKiDauu6CXr4DJKRy+JP3zqtusEZ3z2zxzoN77ekZro9h
         nQXo06kZFH1+vxEaUVKwkn2hYVohz6UrONupQFqdZnPLxzGZA3/sbsd74/OuFJwzJtfQ
         yHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062110; x=1792666910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=;
        b=yLv8y+1gC9p3x5xBCCAI0s/mW+MxY4ePjoPvEXaKQgNm5uku0okK0elH9iLNqNcS7r
         H4MPHoIhKaTMp/GLRvrymgMFq7+bIj0/3XR37HGpqabOKc0joWIsjrQOTbJ/NAq6ZVeb
         hh9lYIzY3tv9p6cmZA3NG66dOs1GWUI6AcrgWEFRK4j/oQbDG9A8ZUTFSEDyNsmGDMGf
         /lHKEd0ptILSEImvTyEUIR9ehCTs/yEJ/53Q7mf5LkM/Ty/r8mMWsvCkKp0Y5sUWuM6Q
         BUSMe1paMP2hJVrND0M0Tjb6LF+1NqKP6JmpwWnVFf03OjWFaeGLBMYPy+b06A+4YfcN
         dO8g==
X-Forwarded-Encrypted: i=1; AKwUvByZAFAAObOLS6HLbEoThIwxPNqB4KXZPXCKa8Xx0RoaHzinUGVS/90kidvQsuBJ1owbyeOzDoQPUF8f@vger.kernel.org
X-Gm-Message-State: AFq9FYIk9rn7w8o9jtFN5qp7/nQwnfdqt6cGPI0wWevenNdP1MtkxaU6
	isfWVC0+T8uHDFxbAQls7JJS6+vXTkibTKgJwqDiiLtr8DMwGtc/mPQeyztpEJ3ioZNQp+bs3iY
	nNWjJ+rGKtCdjQy88bwqYr6J7JfsqxUyVWT6ImgQoC8Wqs49ut8fi8imGj/J8cqQl
X-Gm-Gg: AYBFou13wp/AwgoNlj9TRZVEQ6QGWA4os6dxpdGAHZyDAuPP09ZtgbpsSC2RoPmj2LD
	sJpDSzm+brKIDvGB7ONujOsx4532vFnkLCffxk/9vCGsvHdHQuj983D+kRz/3DN1tuvQgbaH7iG
	TmW8nrAr3rcOA/VjyrZslpDJG82P/qEGXsPKlL7V+BbkTtNAFsJZJOlH6o6gk0WMFrbdDRvyLEc
	IevMzp/I0Jk2mLwD7TfM1otQg6JwU77nytUQ+NlUrK0V0JUg9rp+5nqs15HVFm/MwkA6QhBW5Zy
	HFMIBp1/d5bAS7vUGBOdBnGGyKK7JqLaVbcIxOvNdHs2Nq/y3y3bROcbkHHrXew52dKiOUqAsab
	DUPxar3iSltEjqVfdWZPTHA==
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1758687e0c.2.1792062110402;
        Thu, 15 Oct 2026 04:01:50 -0700 (PDT)
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1758621e0c.2.1792062109804;
        Thu, 15 Oct 2026 04:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3f8557c767sm45945766b.50.2026.10.15.04.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:01:48 -0700 (PDT)
Message-ID: <b422b3c2-ea11-4ee2-b3ac-9e58f486ccd4@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm6350-lena: Enable PMK8350
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-8-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-8-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5gqH1aUjq5vC
 UZwLuGQPNoOUSLCw++/OZ7jQ22kLPsWxv1h56hwDInVXIwcQsXYjmQUllqXCuyxA6f4o2/UYdwJ
 FCgeC0Ag+POfgr/MhLW2CU97KEnWZF8=
X-Proofpoint-ORIG-GUID: vZSZaj4ZbVMu9kJtWY6zsm1odd-mCakv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX35aVWVJ/7Sfg
 17AGncpmv3FzbFhlIiaGBlWqF4P2vIbqc/sIxP8cLUgXyS19RfQxF02HwLJPUCGHZhbj3/QtWfY
 XGSUelsAIL9qh9PttXhw7H1V0yShEEhTZBf90NweOsD32242xZWGDHrMVQY6waqNjoZZA7cQTCf
 aZgpnha0TjoK264Bg2Bn8+7JldNCe16gDIuaEf+g5tfUq6rx8QzGrcjfPAcnO2bh3H4mdkiextx
 79eRuGr8M29kcV2n77Pp5A6Vw4sZCfrwyyFp82Y5vAAuBx3QKPkVtwVIYl1Wue5fomYQG6P3mdv
 L+Zqre/3Cu9upNzdNHxvedFgvHjJOSC/x73+/HmC9pCUpv4LvhW8HQI8Ur/jRlZ64Wfw8ZgDCBP
 wgk7hsdtQRUcq/hvB1RAxetRyLRn9aNNWk7uGbdWoXPFQWRoRSDxemiIMj9NTg9zVQy8LZwZC0b
 E6r2DMwO3nQglimJUww==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0b29f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=JHwpSSwbIGnF5Ym6y0QA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: vZSZaj4ZbVMu9kJtWY6zsm1odd-mCakv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
