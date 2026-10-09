Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2214F3901
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568524; cv=none; b=lX3nElKFDxXc5CLJ8D3ofx3/8ROAVIzacW4Ok8g+MemtE5e4QlPw559rC9aU4buDyMvrcPBdejxE0d2u7nlnYqlbYKhCRnGNLkQOxNLyXiesMK0vK9/bnkUnr1XfpKh3eP4FP9EXcx86DiC0YufBuKoT67luBuTUbcFXS+32/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568524; c=relaxed/simple;
	bh=iEOHEFQwaCBVSsgwFlHdaofOAFLIBr7wK2sbSF616g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqk943lZ3WwlyYqx7DxvKtfCiTeHVgHlUZEmDIySX3Si5KN5XDvvEgZG/0zdMPf5E7z5Z9oaznO375F770+AGDXA3MXWiOhMFSJqh/DzBcKrFKmNCdIxJ7biqZATSEE0ZuUlmbrDQJO+7nXoyNhkAa4SKXigza5yO8POfJogen0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VofSxOzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW1JhgsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VofSxOzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW1JhgsD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HaO891447819
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 17:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fET6JJlgQgegeTec0LONYZT4
	3AzcA9aszdgk7MPJrKE=; b=VofSxOzl8nOTYLTNkXiYEgilg0PT9TcnNV//cgdE
	HHyzxV2Yy11Bk62/hteji6zo7VhE8qIEGTFtFZ1nMcisN0F+IdhJC5xAgHjcuXgm
	oqLmhfv7Fd2YOlbcGl5ASJR5BQeSPm44VoJ7l7Znoa5vsgyDhxeZi+ggzp5TYrFQ
	5qr1F1/dm2TwILPMay/sSAvoFuYmq/MQKjFiK2gaCHJCoEZIQNgXzrZdB6aUeCC3
	kjLcvQC1JqvE426mngo3/kh3qqQjbTbsXemUUxWXMXbxJS6raTFWCuW19BYa2dPs
	/WGRJ6Fn6HhtEOyG1hv413/46jWjQVEicetgJxYpcgaAJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74tbg3ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 17:55:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso854961685a.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791568514; x=1792173314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fET6JJlgQgegeTec0LONYZT43AzcA9aszdgk7MPJrKE=;
        b=AW1JhgsDatre0NfhzNdIVqp4/f7jmSzL8wb8xRaqxQn5egA8weXO77ZnxJ9pDZevlh
         29OgcdxxzCTS61DhYMIOvEib5XzuL4aj4jipR7QFb7mOeTV9BJZ2NsZ/cOuxXOYiAveR
         iaZDIBoB86FWRee856f7YFDkIjQFwy+5ibnUfXUUakgQpqyuC2gAr8o6VKv28BOnbJrk
         O4QJlkVUTpJEOMlSh29sLqWPShf1Q7FJ4lxjkjCtbz04lCehAOiSiqKnoTpt/zXTuiyD
         25rSrTTZ3hm+X/QKEEC+nNHPulCCWXGx85rQ7Q1xYNs4A6sztd//immMVhYuogI8puDi
         6/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568514; x=1792173314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fET6JJlgQgegeTec0LONYZT43AzcA9aszdgk7MPJrKE=;
        b=fXmyr/JwhBR69MOW0QRK24dB1h4UB1DRihuZwy2AshNRCCgF/28U8Ct4ghtYhGaG4i
         X2aZQXIyTb6mBZvCeUuj6NHTPUat2HpySAN3HDdWQvYFJoGqMFvSwxOLiMulfob7keWq
         rky91mTwfwQoMHyrMDX2x6J1HfIFpjh5U08xvpoW7tQuet3cm6Ii+SRYuJhqv071ii8W
         ijD78d0Zao9L9twMoRnap55L/1VfFjFDNgFw/rwlpchVi+xvhXrz7tryxzaZXttBg+GI
         vtguMVDRE8W3/ia3QwUQYu6eZjwD9j/0TUMx4vdwNtsVmTe3//C++0adYyk28+MVkbpL
         y0FQ==
X-Forwarded-Encrypted: i=1; AKwUvBynk/FY5hqGCwdJjMZa0yf9FL6EO4ph/ZkG5LOeriQyxu697mCOBsQylRoa/yeOkHbEj8I5fO4bDj/d@vger.kernel.org
X-Gm-Message-State: AFq9FYKSTS8b2nwPaq1KcAJ0fdXdusW5mLlgRXdfSEOds+6ym3mh2P9X
	wqlhf+ghX0cqVWhTi4NGN43yjIZzpRKF7REjoE/K2QblTFPZDsrxNPkV8LrAQXCyIgGmVkXfv6t
	hcXaYck/GS2PNjS8WGQ9qZdyC+6giR+s0VmvsWWMLm3WB30niSUT/moDAwH240D1R
X-Gm-Gg: AYBFou0TC7Tzje9yXkaMY14uOPVGGFZy+d74ecCwUd3LlCU/zj27r+jUaz1zLqP2Niz
	aRgB0uOJNdUjH+GsoXg/O5mU50hIMeRMMYmx/Mob1OY9PCZuPvnpwC87gXYJ65BlgBEoO21o6y3
	aTuav28Ab0BvhmWm7RM/iSjQKK0c05k7wq9iL1exUydFHxmjdreHPfjbWkJZsAbaidWNh95jHWP
	FZ/vdyHQNrfQm786KixipNKKFEcHF/qeWmtAfmkYR+f4KAspkwfz/o5z2vl4wy5HqYIo70MbAfe
	pvDOqzuLshH0bVBGx23SMVhuYtUknzLtLuDrRHdNCwsNoYUehNmULxLKvzWV4ia7/aZ15GK+dPe
	SuBJLSkKuFfnwPc0=
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr226088085a.82.1791568513648;
        Fri, 09 Oct 2026 10:55:13 -0700 (PDT)
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr226083685a.82.1791568512885;
        Fri, 09 Oct 2026 10:55:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm5036154f8f.26.2026.10.09.10.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:55:12 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:55:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to
 NEGCC
Message-ID: <wdu3imzn3uyuyf4bx63taw3bsdkqfj33bwvspv6qksqqzeywri@m4m73yzq7vzu>
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RcEFmFtv c=1 sm=1 tr=0 ts=6ac92a82 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CT77jpgJOzp5x1a-ItwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfXz+L6tnWa+L0C
 qcJa5ddymSUBEuCguV2eClSfTjBSUxMqGIDqtO+S6mVKzMX/rdJSOEmj0vuoQp12odS5Zwt3N9x
 fFoNTRgpXLuTlZYE5qRBhBg+LzmIfKesOGo/sn6s7LMWFAdG/D1Es0iCm2R4Ub2vXOI7Qu/3Yau
 MTk1v87fDVvQjqbU9vfgBIUAmcURtF8SJpoXK6oOsWQagkLbheUWDrpXAVBxMhgsLhYkvzzpcGS
 oDQouGkuTk2P9fR0/i0F+984HAzpUetkepZrJ9lQsouM/VLaUB2i3Y9PrZytlyKLY+LaAW8IwVw
 ZrIILFLYEnKaYwzVrNxDog+HGPPk2/JZwkccdIHxk/Ef/zPWwM8wRKmWUxlDC1+zrEpJeYdvk8y
 8ksJJwnYYGVM9G/xdk0po6H3Pqhg+sQAP4KZmPgvXzB0NSEFCa5wtk9ZLd0X5Jf91a6bYNgq/LZ
 3t3SuOXkNqJGVPRU5/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfX75ec+wrGfONa
 FHciMnSGpaHuWoRpMDZolY3Tg/oZsVkq6/ZwD6NG07ZXMe3EOwqlcgwTU2HUPjSrSoJXwz/koMO
 bAHiF4+YzviVbChFug5PtY7WpSVbjyI=
X-Proofpoint-GUID: yNm3V6UEGVPxZVEwigOsIH-IKn3-ntXh
X-Proofpoint-ORIG-GUID: yNm3V6UEGVPxZVEwigOsIH-IKn3-ntXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090071

On 26-10-08 16:56:40, Shawn Guo wrote:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
