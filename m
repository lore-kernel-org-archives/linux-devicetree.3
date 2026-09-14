Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A86D3B71B8
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371746; cv=none; b=XIEyAPY6gmqvRc0zvRrFcJfhy+BY/g6iRBpJm9UoNJZDMwmrErLMjk5B+awW4bU6wgHiEbst6qZZSntMUWPKleSb+Vmf+O3IM7h1DQPnCPwRxCKkQReVvQXD11qSXKorGmP7rIikBoGOAEOL8SEgF2tacNyFrU3ElFfVarfTHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371746; c=relaxed/simple;
	bh=hEGigLVsABYi+19iFHU7a7vBcEAe4a7cZGQQsrQeVtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjXBX5qpMXAlTIdxI0eKYBFTLMv1X00jZctgoy4VtE31fHTf3okslup8Az0xfjEOvkL3ZrCMHtDBNUwAgLMZb68ieiMcAQcsHP5O8/0E8GXwkX+qBvK08yGwZRt+2kM8kY2xPjjiCdOP3qXDpJxdnNskosF0pmoLXQcui6DNFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT8OwkmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac+EhU2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lT8OwkmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac+EhU2y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikiO3369126
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1KPSWCtPsZzDfnveyc4r3Sgx
	7K6pKqfSWEz8fsSXk0w=; b=lT8OwkmRRJtmiY/4tCbbPA8fImxSW0A65QLf0Nrd
	4YytYhgLTovlK1VqLZSVF3QMxR/LkGiQfvJzBue42eVKaSdPu4AEUe1um5VodSA3
	PhUZICCBWI3UhEySH796Ft2Nbsd8xsqqoqTjjv3K9MouIItmhZuXuQA3HFB5g7La
	ULFMYbflyVhlnef66XLPGxDGFjZLNXfpBtD07Egg/wrAouZQEr4eAAL0IMfoQZdK
	KmMKNZu3spFrk4Jbny3+5s9pxqABV/p9E69PW3aexhOLshOvwIZTsf3iCJVatc67
	idPEDOWQ+Ji431apmCD1LVmpq3plb02wZY1nKs5+66SfPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5k60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso46858985a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371743; x=1789976543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1KPSWCtPsZzDfnveyc4r3Sgx7K6pKqfSWEz8fsSXk0w=;
        b=Ac+EhU2yyFSejFuYBlA2TWSbB+3Deg7TieRt/ZUSY9Samr2fMa1zUbMsJUujWLtloa
         nZ7TsczBSMkxhLvJ7m+A1EPNXdu/91Prz1qXIIdJA8nQ/2MdBorejeH2XDW9QzbuJMwn
         Nyk79a2jeaH/FWynnO2kDspvy4Oa7kWyGmOpdNHfglPQrmdKvpMWrw/4bHCjR5wzB5+3
         ljR4u0Hrs2kH3Ux64u+sHZRDHbMr1IcFne8tLal46E2A/MVnxKHrnScGooDMyorqAzLE
         0++P4lGC3xqy0WLjobOf9Y3L5mDeCqsX0XHZxHCuh8UXTYTNN2VZbmSoeOPICjKLVRim
         q7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371743; x=1789976543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KPSWCtPsZzDfnveyc4r3Sgx7K6pKqfSWEz8fsSXk0w=;
        b=dOiJj+NLQpzGN09rlbDy5JbPwiJsg2JgV+7OxnB97BKMXfsPfA1LvGTTdgpLnRx8Sm
         wuTLGCXaDzK3QngnBHDyQdZZOIMHUK/1TQI3l7SUek0rbc7dfo9Ti5cT0Re97VniDWZB
         fkzVD5IChnAu73J4nZzNxIjqZiqCIf78Suv4A/zhCdXU4AKq19uOLImM+MWB0oSFZG34
         fvFjSHfbwpNYMQAyffzK/2VUM/C8wDRcVnM/mNlNwxZ1ffqz9lgd2xR2xfm0PAdFcRv+
         Tr1HdCUo5YPpbknSAuAtryatJbWmQAw+HtjF9FC8D811hiYTaPprjqidzbs0Qn+Ki/oV
         vrqw==
X-Forwarded-Encrypted: i=1; AKwUvByidyYKdN8y/1B0rO9Un5C61nmSr/L1cc3htr2+x7FqljhWxr0aLZOSaCEzgu9UxAdeqszYDPDvkw+y@vger.kernel.org
X-Gm-Message-State: AFuF++nyESGKiwkbOy+nmxxD8OgDOxYE+Lge6+dNr7PxOIWzL301L57K
	xOGrMSTl/pJb+KItn0/dXYstBcV/45F8vHl/Xf3MPutdWxhUwez69R5NJoQOagBb9zKAnOohplU
	B3coAgJ5jhzyy63Fnc2I4iU82x7YI7SDMVYvAu2HMiC8Gt8RXJAqE3f8PgIg6O+xt
X-Gm-Gg: AYBFou2KurAO32momjluUYlmkCPhRV0hyQkQWrwDf/7k84bAug5hjShr5/3zpO0RI5K
	n1JIg1pQWnMppRY+zFDv22+16FJOHTDHG3DI+mJnu0cM6OXGNPoFsMg3gdYPkb3JqMyMw64P05J
	LDlASaKmNcM2s5hOdj8sYcYhDCs2OpGXkkei87Dqki8AmXT3lPBtz/Yt60QJ2Kqva7X3NPopRpV
	ctS3DLlIHFuLoY0v8vfIE4bUtWIYS/8I8+EVF4SIuNj1ok2hSD4dJn1SI85Q3fP4w5E1r3GZne5
	AYrAqS0SqmOHRLzgqqCo8KdjPu1cEK1IievxhGJbyx4u8tf1dvMaGc6XH49FDvEyn5PItEuXLFc
	XxGTgt/Rm2ZX86Q==
X-Received: by 2002:a05:620a:601c:b0:932:df7e:b31d with SMTP id af79cd13be357-93a29847db7mr177788485a.12.1789371743473;
        Mon, 14 Sep 2026 00:42:23 -0700 (PDT)
X-Received: by 2002:a05:620a:601c:b0:932:df7e:b31d with SMTP id af79cd13be357-93a29847db7mr177786285a.12.1789371743003;
        Mon, 14 Sep 2026 00:42:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c0cb676sm213066355e9.14.2026.09.14.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 25/31] arm64: dts: qcom: qdu1000: Add domain idle state
 names
Message-ID: <ah6tud7odwqbpb6otxzmv5zqsorlkjkzyp7xbsushzxe43kowq@etgojpyqxcnc>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a560 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXzBXxzlpJUoKh
 9bxTWEhyztAXc6qYm7ygG2KMubZ27bnsQhlUnSiHUAo4HYavT+6vfoPfHSycx927vQuCKw6TfHP
 /5H3h2CYxHjZ0t/2UW0h013czq69ennTWWHYcDu9Pkqr7E003rQxi0FGGPwdk07e2E0XF23O6qB
 h3obja/pSDs8fxYiO6x1F+SsbusNsOMVtuTlqHubsfpCAo8XTHYp9FBSU0fQzcmcTwpG3UYHZx0
 rR2tYPnVz9Pstl+f5I3YO12SVgYxJQJKXRXQPGh2QmldXqFAnNp6c64LOIK2/xQhNkQU3quW4nR
 13fuuJZVzJ2HR9Fda74/yP6uoqMo7VTtGZ12ydDOyF80UWx6TNSg6slaeh7o/3KiIaLxLemUGHK
 t3Hm+A9RjMXRILEomvXlCs1ppLLGpRp1WDl0tCoIwcwVvf2hF9sFgzf70XT1pi2pLNVk37jo+Q4
 udAv4oZu+XruQXG/4mQ==
X-Proofpoint-ORIG-GUID: QENbyzLTdf_gQcpxAm9QuRTeAdL-6OzW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX04kqSFe+uzcf
 qs+965HxeqU/ankGauw+69B6PijCJkHIhqUOPQzmvRyt1bamqCV/nWCOW5abBytiUTwb6bDlHmQ
 F2t2WWpqWCmept6IbcGCX7kDbbsW6BA=
X-Proofpoint-GUID: QENbyzLTdf_gQcpxAm9QuRTeAdL-6OzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:57, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
