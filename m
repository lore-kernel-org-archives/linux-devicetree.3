Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4D4EDCD0
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614002; cv=none; b=LEPNPHpmLprvg12nLdCKq1tGbJzHncCM7fGpRtmNG07bDKbtXYHoBedjlLJUzuNkNhi9AXcsRGoB8PtFNTLHb3SntXMZ6THsmfjIwcOm72bM+5ClsJFqt0I1lIWWUNlwGJZIDDcxNW4fg2n3/t3PmYm51a+DRmiMEOgj7xUVmlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614002; c=relaxed/simple;
	bh=wUgGtA7dLjx1lOGU2OV5DEmUzecs4ta1J+YCw2zPXZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCFXByoZBHJRKZqyIk0GtOIzB3KiOg8HTCmDUoMUhetutowpv2N8iHERmQvbGS4DjdU/bMA91akYE5bZlWrbw5ccOM8cPTCQS8cphbKwpx/MBVn+XqeQbDTOF3Z/nd0fKcm2yDUR403Ri2m8ofWjGsM8Gx6fET0CpCtgqrngSio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyIv0RSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qc9GIs9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyIv0RSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qc9GIs9D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe3E02298484
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y1uRUm4Mo5eB3KKuXU2hZKYR
	+aEDg87giYh07OUbqjo=; b=JyIv0RSAPLr6JQptCu9MOX7mPKUUSPI8mN96f/tg
	9sVCgrtVux9OCIUV/f2bpcJ6U87A4u+fDbb8DZNLgvMDgO5XEL2wIHsc3fLGLuar
	sOaBdiwDR2U7BYa61O/1VdrQp9qnxE0z4h1eILm+5TS7hUADMTiNMGviqv1Qepl7
	qHw5d4Du4OuowVJLsbvmcbial2hNGfDJvnmeYK4QsOB7fZ4XSQA7DpsWXwFQvdde
	NgGLAjnryUjOvYDcEcD+Lhh6vaHbN8KxreRTAGdy3bCc2fsSyVnQEdLD7wd+5Jya
	FOW1xkFa3oLP0F0IRiToCdUVlr0NH4O1dbW79KLE+jmKjg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6htp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:46:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b206156cc6so2753268137.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613999; x=1791218799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1uRUm4Mo5eB3KKuXU2hZKYR+aEDg87giYh07OUbqjo=;
        b=Qc9GIs9DEz0XU93Oz7FQEbWgUAbvLfZ+RlJ/E3UQqZFhhhdTXXyOJ/zAeKFjKasuHW
         0jhdLw+cdy0cZeT5pHsyLJumAGSSWs1O04IGBgAuBRr4TgrLvT6kdQpAVFbY24/rVRB0
         qRrio0VnsHIdCB+Bg4fOAWf0Nx4uVMiUczt49Yvox7b8aTsZwTQUEM0SACdMSAvgPalH
         TH3h+j1vEyRqzpDlR3vZfX3EHUeckvhlT9t2wjE3J4MECMTxbiq1Uptu4zNtnTfZb2e7
         SGuBKkMtXwiYDrt923jdxrXGwT/tBeoDwn8beHxVOkd8sO4f5BuF27X69CRTDnKAElgW
         PhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613999; x=1791218799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1uRUm4Mo5eB3KKuXU2hZKYR+aEDg87giYh07OUbqjo=;
        b=GbWUIvwd9ni867OxrcXF57Ibg2wlLGCVrSbB69IIW8CUQL+Yi+iEUnIBR94kXTgLuy
         AiA3+8M66PWHJDFT3Bh8D131K/4vNBlHrkOys6l7cfpRzhJmLPQa8nrXNGDsVPB2/p+O
         Oh06PUIUGomIEu04mfFG55vFys4jOhzBRzo0H6WY4DtRLkysLvJaaY4/sUQ0jcyILiAY
         3cefjIJ3n13+1r5xx/7PnICwXfdw4JPDeqBhXVMz7ussqhnKSRdq/giUm6dujw3bc7EN
         mzLT0IFZNizoRbzqA/6Iq0iab5wC48e5m3eNV6WGNlLpS2r79yMrOWeda6UToFBTnfl1
         6mGQ==
X-Forwarded-Encrypted: i=1; AKwUvByVZcLTZXe0u1EGotsOLGyud++klIzJI4jFizLOAHo5QdZUDXdc85c+g9wvZjqka6qlCdW1oQH1phWB@vger.kernel.org
X-Gm-Message-State: AFq9FYIIwo6DDAKieQcY5q/WdSegbAgnPJhrJn1toENI5M5BffK1HOqk
	HbOFYjSbhvFC2dPhSUbKPv/JAXuBHR4L9yoMqppJJ40yDJ71E1+YX/KDk4glfYTOziXJXbIPOPJ
	a4j2Dfk2r4iQpFHgbPxByYw7TpPQ9hyQzI1RKFR8mIcNwg4Xv4dKegjFoHVuO8CqL
X-Gm-Gg: AYBFou3i09uuOeV3fNN3ihJA4BylubRtjuCJgHFoP53X1c4oF076/gvLthc+PkQk07g
	Y5C3Ka+r7Dsik6N9sZmgFv5SS4fomAld9fOS9n7IQHPZkSp7xtzGU4tc0wOCIajdOtEqEU+tgQv
	5J4l7knDG31lhXf6mDpoOesa32tnMwK9I2sz6l7Yr/eedRIODR/v2Orlwk0VUkB04XE0fjhmagM
	o916CQWdUOmuxgW+SCQ9oqzL8neKp1i8cCm9K5bj6yQGmUinkZk+iGwnn3QgxxKU2Hg/jELDWDc
	HogHHQjK6nmoMeH3+pLmElMLKs/VNKdz0CKfy4dFG3KGgma8PE48yfR+Fgv+UAL9Hb3/Bw0sWLB
	Y15fPvDQ+Nmr7nA8=
X-Received: by 2002:a05:6102:2c0d:b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7b42ace0b41mr1518934137.25.1790613998535;
        Mon, 28 Sep 2026 09:46:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7b42ace0b41mr1518400137.25.1790613968218;
        Mon, 28 Sep 2026 09:46:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea071sm4017915e9.9.2026.09.28.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:46:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:46:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Enable IRIS video codec
Message-ID: <s6fxuj3ipfz6nl2hm2pdcpgaj5fxx2rpurxtdfy7fo2srwqe2i@smx3fy6ukxzx>
References: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXxJgskh/rnk0E
 ViQWozWkUS/2IpSOhDeXl+kZr0k+GvgspyuRqBgb/VN605vwPR1gQtKl76CbUzySitYcm+Ipoh0
 gL6wmPmzwceGwu9v4wmq/6UmzCGHAZDY3kMVwqYgHyAempgeb076vEBDn7Irb1VZwvzUuPx1XS0
 Kc0O1b3p+ru0pNjjW0UWVv1BcqLJ3QWZ4nNjO7Vbr7T3DpeTjX1+cnh9xPhajRGqovS4bkRBFqE
 QsKHZiszAWyLrFNQqIvT/exCc7xciM58rxa3n4JjB6xiL32Z7GuTfIDA6WvNsZydOPbI06sMk95
 YgRV5ur4INzl1C/KO3tv83ezUqOCzQ6jykGTkcXnMbfw372finNoauReHwZwUqpua/5qx+DFza6
 xG95TSA8hGA1FHYhN3bYur7MITpptP7Yiq5PrZPbBoGCeZDImeRoDmv5o/RX9f04JdVBTlV43u+
 J9512UPFkJOrV4XY5Fg==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba99ef cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gHjZUIugi9cSBFQiOBsA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX+ntq8T+YYFID
 SkZst5xzFKeQQud0gDSkC0v361GHX9ILRCTQq/xZ8FbL8DZIjPLKg1NrXj5xcHQSXv6Pofd2YgD
 orfX9nsGlT13h7h7jKWfEuYjVYO3hXg=
X-Proofpoint-ORIG-GUID: 37p2ZIdFkJDHyhl4hwOWn3Y0l-np24iJ
X-Proofpoint-GUID: 37p2ZIdFkJDHyhl4hwOWn3Y0l-np24iJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

On 26-09-25 21:51:03, Dale Whinham wrote:
> Enable the video codec and point it at the Denali firmware.
> 
> With the firmware in place video0 and video1 appear:
> 
> $ v4l2-ctl -d /dev/video0 --info --list-formats-out
>       Driver name      : iris_driver
>       Card type        : Iris Decoder
>       Bus info         : plat:aa00000.video-codec:dec
>       [0]: 'H264' (H.264, compressed, dyn-resolution)
>       [1]: 'HEVC' (HEVC, compressed, dyn-resolution)
>       [2]: 'VP90' (VP9, compressed, dyn-resolution)
>       [3]: 'AV01' (AV1 OBU Stream, compressed, dyn-resolution)
> 
> $ v4l2-ctl -d /dev/video1 --info --list-formats
>       Driver name      : iris_driver
>       Card type        : Iris Encoder
>       Bus info         : plat:aa00000.video-codec:enc
>       [0]: 'H264' (H.264, compressed, enc-cap-frame-interval)
>       [1]: 'HEVC' (HEVC, compressed, enc-cap-frame-interval)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
