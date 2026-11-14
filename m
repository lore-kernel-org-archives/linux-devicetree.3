Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668418;
	b=2p1tYQh/LwS/0TJzVCoaztPkxENHgCvyZ5lz26MWoPfgyfMVTTNreX7ZAlBxmDvb+0qv
	 MQFXjUaOQghACmwbR9056daMai6ktpE0PxJTUFzo20VRTv/Rz8vyh77ol8FOZuoWSjkBE
	 Dv6ctHsX+MXLOvgu0q5Z0O4hlGKNR6LYqEjz2gTy54yGqdPFtUCucl+1JwiZ8TGNZkpkf
	 oqYv6xkl3o5vz+6fO9tZkZpSZyBQnoRwnpxF6CrsojSe0+EsjzoaQRXpIcbl/BhVntDLh
	 YivvGmYrswmidN9o4OiZflTHFrLAvu3WR8DsYaCOz0zcEjXa2haysEgamlGpH2xh7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
	b=TdouRadC14XccvHo8XUTyiZOSql9/Auq1LhQt/PKqVkp7/hxYC0rA2fagZIHNBgMDUMw
	 jsq4TTH5+txG92QDA6w84ld8KpkhG3yK70F2KcfdFvJDcKkc2NncgnNOpCQWMQfO2FQTB
	 XOdMN5MyWGLKFkjr/SHvBvr5+BRtToM5WLWuuqx6dERcEHRyE1HOhdIZulMG5BibTLslJ
	 ZdR3U3SU85O2oIZ7Kyu4aLPDhmiP9ufuzxAycUzEiRbYFZmF23RS3l/BEbj/MbrM8mJGS
	 lCgp24Eb73qVmJ/bcIZNYF9kP2YdBv5M8uSiI1J62V5JLrWAfgFnLMPNFYlBin1TwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2XjFc5n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iA2ZgX7x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363BE606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2XjFc5n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iA2ZgX7x
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkOoM640556
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qOrC9Gal9RVwYSi5qGrxcqYT
	bHgtm36z+0K2fpmAefE=; b=M2XjFc5norZGnS5LN1iIIlGtcwXdC4gfRvAtqu+i
	dKzv/FHjijAjDU4oJ1aU/mt6w8jec+VF+TG9uEwmVdK7mXms84d5/y3nEYIiGR/m
	1yBCd7undewnAWbrk400iPYU/5U78xWDH+loqVYKKrazslvik8MBcxMFKvbbEBww
	X7Bh5+JsRrQ+YfTH2PNDRKk5dYnL8PLxFq/pzOO1JVLmwMp6bLbdRmUvhAt4iYFo
	E0K2Wn1+sA2K//mqVTvtO0e6amQtzAQY9Fmb50fpBTEgAxg0kj7BHD5AvBEos/lj
	mCsaUhAWpWEiv0y3p1flEN7VjidHWblQvHAwQrihkdtRcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmah014-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:00:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so444607585a.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794668416; x=1795273216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
        b=iA2ZgX7xKLR+aBlD0+J3BycBis7yeKzUewlkkyxusZYbpPqQlPjV94IH1S05gCRBSN
         kP5yc2nZoeU/q1Hz5D9lRNQ52UChyaDNhS36bihbtGmwVkm+FeMHMtBzIZTP1dk8nH6Z
         x/wOUM5n1iP+IH/CIPosuGFibkLBuZm3e8YD3/WqaYZK/Vzp0BEVwohUygma9ICKkzY6
         NvSqCwxHHG/FnjqojNK66X60cnapq61C40QbobIkCiFunL/aJcWHFkGTYiY6dcq/od2A
         /wXDP2o7nyv++fyl5nPS0XOcbcH5joXB4isohXaMBdp2soampU7f9wsT6J8hDKkNoZ4F
         af0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668416; x=1795273216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
        b=SJ8tZ+WOx2z7bmksVaAnjwDrMAPB60kkx8FnOerVqiZGABxqhwWRUDjy1JTnkhnXkF
         MEuyvwVGiUafuxR6+M8wnW7yTE+SupnLEq2uBnOl0fv+jIqeUJP1ON784LgmT+GsA2hJ
         pSFieUfKbrOH+c3WaRnf29tmu9TKp8FkkqELb/KIT4qajnu0GNNN72Po/xyBEp7c7yfc
         VqYFL6MeAenciKvhnxxLcKkV5PyX9O9J4Yf/OPxVFMsKhXiw5wrQ/KsSOk+jvu6m8N5U
         twh2yecb3IP39/U+cx8O86XV8hOpiPehaFYo+KrHVz4DCIjNWSLcw2G8haljGAQJ0kEK
         C1kA==
X-Forwarded-Encrypted: i=1; AL+hErG/4czW1bh0PXZmORa1viLGsQNaPANoZ4SMiVafjCKyorznEv7CCkNxn0AQe7pjYVKyqN/tQFsf1IZW@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cg6zCAzry57sr8At1IeME1Q1ZASY5eK3eV5OmH3P9JnLbz/xW
	NTEK7xgQf65b5LyQmYb4Vcmp/iG1Of3bjvSXtZOnzW8VjElEIWkbIWuAMOxChTRvjo3/uiCIzlD
	uJEldgB3u+miG+tJSpsueSuSBDMcG1LUPbvvBhki0e4oJNXT1RNydAy8/Lk6b7ByP
X-Gm-Gg: AYBFou1rnpE2n046KdIfBhXrOTj2nKOIr1xU+l9QBR9B9s1hNJJlb1WxhXDKfG52BU7
	Up8uMkDhXgXxF5y3YRlv6RXrJJVnGnUAKczl1MYOSukF7bOHyTp6AtE09SmDiUrOjXw2b/nIwKG
	dUYfyry490IDdEEYZmTrri9+4RVITkCwCidvNO64qJzWq00A3fATeL3Bw3mDtvjS2otVx/Lgdph
	bjRjmDcAVzCRvKeV50+rEGRBMsIcpZ1dExpMnXeVegzr5JOhQ2fSxT94t08buYqKUEmgJYfld9L
	aC4ll0infMboPejl1E8+s5YRxeE99l88v1oCmo2tOXZ20DhJRe5mXutFWKcvzx8g+I5LI1hDSgO
	b0EweyKc4BcsYXrUu/vF3WbP6EmufHw32Q805Fs1Q4l5/rSUYFm99h7u9rABT5Omk
X-Received: by 2002:a05:620a:3188:b0:93e:f9ba:6902 with SMTP id af79cd13be357-9494ba5f9bdmr950502485a.9.1794668414944;
        Sat, 14 Nov 2026 07:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93e:f9ba:6902 with SMTP id af79cd13be357-9494ba5f9bdmr950489985a.9.1794668414018;
        Sat, 14 Nov 2026 07:00:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm238605295e9.8.2026.11.14.07.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:00:13 -0800 (PST)
Date: Sat, 14 Nov 2026 17:00:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
Message-ID: <is4zc3hirwt4huslzeciykg3qrzl4yp3rvr64i3wd5r6ivopx5@hk6nmoqiismg>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
 <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
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
In-Reply-To: <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SsMnOPnxk2d6CSToztUHcPRiyFfkdEPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX5+XCVQeCKlYJ
 Bopna1fYh2Q+D4vefn5ha2314AA/DG8HFip303kQNUjywnNyTQ07mYMIGbDa9Bb44fdVJHu22GV
 uS5smpdTz7DkTtLRxhIBvWraEfWyIaTGHURcCzEmpAdzc2O4ATATYxHCIdqzdYW31idEikHXqfd
 +glGOjf51MkJLgoaMimFkpjSmeJbG1yzDnBjfG1bko34/olb9Uip9hBCT4cSsXfsaum9rkcfG+G
 lYhI+sTeshi9Pd6bgpAldAwmnchmcrOb105EXXAhqC+GSXJQ6B0Mw84xQFnzmNXxVK9jzhLnlYy
 +4c8gjg5QZun8erJb9oZIqxpdkzYbnnMiaIoCBKe6yAD9yVq21Zxqt65O3l5PSmQcyMlSe0DXIZ
 Q3b8ZsUMM1hR0FUdq2bT/tHzm65rfx3UjJSeom5khje5uH4q4QjhDwE8DQX7ZuG4vfuxo7lRVC/
 PTtvEkz3TEtZ+W4bLbQ==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af87780 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eaVRD4h8osDMoe4b1p8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SsMnOPnxk2d6CSToztUHcPRiyFfkdEPe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX+9cmCfzW5Lm/
 V2HcdvL32bnJjsbodd1KBbZgHN3WR1/yC4w2vLYY45QZYS9JuS19jw5/rVchni92v1uucVERnXw
 IlV8R1V2A4yAqVRr8sHdbxG2xTDbZcY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 22:28:27, Bjorn Andersson wrote:
> The ASUS Ascent QN10 provides functional uefisecapp over qseecom for EFI
> variable access. Add the board to the allowlist.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
