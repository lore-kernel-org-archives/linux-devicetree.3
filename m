Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC93E557E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371872; cv=none; b=RcJGnty+669xJrjPNmKDiSFR672YCj4qk60ZqkuHblelUjy8rgH8a2/kLR8690OVTl/FcQq7CQ+dsJuFp16YZdWB7AbaaV83Owo/+R0lLJhj2RWTKUa8azWAG7RwFcOFughpv9Cj3IRKf/Wb6xeERyowLl6FK5e657+pLZxy4sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371872; c=relaxed/simple;
	bh=P9FxzeMC6lbyENHI8BdJ3yY++OGFptNNDYQD1C5o638=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpbAZECzO6f9rKS/6hND6i7GZTdFnYtGo8LuE7MIsokZYocS4YwYGEfBKQOJwcYNipsiO5/DgMK8SGutyFJoF6D0DRN7cVbZwBGIvXzbk7ogU5PLun0wWTMyodJDihOsrw8ciJnYCtNdlsXxpCaH3H3jDx+fY4/oY++E2pt28QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXzl8vGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejcOicT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXzl8vGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejcOicT5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j0Wj3369533
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/cd802JdT+cCUorD0ME29Cwq
	TidSfnnaAlDvsoD0fbI=; b=QXzl8vGBcHmkbbmUXMpi7SIbtHg4v/l6nT7W4W+V
	EmfD18zYCeTAJbwWtad1b//eZVbqw0d7cxNJlX/xAW+Y2nST21r3memjpHQT/igF
	R33OYAhQcGBdBVFctBG660Z/5iRSYWQvKl/OH4kv7xTsRK16+31QtfpFpmwSRQpW
	lsh8UDhuw0CgpUto7jH8zW80m1nZ9XsE26asmsaksdx+wcjZfmIZVpj8AfBEcWYQ
	Mo7Ox0oMLipsNRyexFKg2XsJOEdqiKvg/Ihx4cBPT8e7fjPnPdxwD13SpBM1p9Yt
	5AogGcugiXnbdPOpuBCkzd4cTDqyt2l1jypQK/RqBfkZ2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5kdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:44:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0c7126e7so241990385a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371870; x=1789976670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cd802JdT+cCUorD0ME29CwqTidSfnnaAlDvsoD0fbI=;
        b=ejcOicT5o5nSaqR6e1nkijBCp02NCJuI7GqR01UDa3S6YpDXJ3xEQ/uUr/HN5AYpG5
         5owpKFP5DaJpkqI8Yz8zl5Wa//8LziIRGgISx3vfBH3/gF261wgH7G+NhXs5etimh3sL
         kQQDVgHn5NbBMvq9Y3WO9vUf5ktEnKj6bAfqG/VFe5KDRYKbcSuB0fPhbaCGOnyqA8Tl
         MDIHTfFyVUuDt8QDziv/QPCNS5JLdwzaS0BHDSExDbY2wxWjHxrGSFYUanhprBBlObln
         aJypdhd91shgDE3dQChpi9nhB86ctK2h8tgdsobeB75TROzDBsr1ZiP7jmu3S3eIbrJe
         JW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371870; x=1789976670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cd802JdT+cCUorD0ME29CwqTidSfnnaAlDvsoD0fbI=;
        b=LxTyqwWk+5n9+beXPdB+uD61F62B7L/ysCNksQbAaz2NrmUv3H/pK/Md5hv5DN8x1T
         LqE6jpBhM7F0WCn7vduk4G8iK/XqAJ2g8UcFviUbNtmwWei0HppAN0/z/iCQvUwUo/5B
         pOVh6CAlbEXoiRtdJzGaIzUF7VsmSEOSt5H7jgOXCQVicFYUXPj/mvd0xvx796vBh3VL
         UpRFyVGWujbSDK4lsucU3OUd2rxWNL2IQClAU+v2YW9V2i+G/520vLMhXnxzOy/xKiRv
         TaYGb1iE7duHy9kxKSTVcop+jDn7Ywry7I4QfpFBT05Rpy0z9nbdMOp2Go6kEQe7IUFM
         V37Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaDTMTVQ05U/WZxJpuB1didGUrXNZSsp5Mzpgy4rvjq53MBeWZuPgfJAdLC0Sw6ZP8wYq1O2+hR7hC@vger.kernel.org
X-Gm-Message-State: AFuF++n3u/tIB2MAokvnZW8Ity9NGDkzl9HUVnmU1JChlHHOW5zEVihI
	iD8ZGWjOul+uv+3Ym5eGcW8KPznk/agVoNX4u5YbBKRUjrggt5yCJRoM3tdGHeNecuPlKpBwQ8f
	G65uk4W7Mdb0wSSeY6PLb6ln9plCqvBD5X5YtMv1hn5mTQOxEBIH8738A3cHYRPD+
X-Gm-Gg: AYBFou1Hs5aW8HGRFmXk3fvDERiKxeIHeiEzPj+6uqT/MimKe7yl3kty+XhwiRdPbdU
	OTi8X8+vEfV9JUCWEN8xbzo2BxRX057kGnrYUqHFaZkFBcpJ4fS+kz/7apgzFAUEhuxyEXOvGzy
	VIioLjlTpiudqs5xId7cROou9byc+Wv3FTVNLjMGfm9+YIprzRVLZFltO54798ZwK5wJ2feltO1
	s1KF7t5aBHdnPu5lF6dYMV9hUQIS/8J1wnQ56UgzGQQkxobOpQKeeSte+G09+EVw3SfMK4HzbXD
	qHp0sjRCZF3Gqf4qWU25NnoViC9pC9cnTgHWjfj3TVWY1nnLtjufAFNjNzmXAHsZPFgoyBzJxEy
	d8uphh2yvObJWjGs=
X-Received: by 2002:a05:620a:3185:b0:939:4b0a:f0fe with SMTP id af79cd13be357-93a2977bc24mr195766885a.14.1789371864698;
        Mon, 14 Sep 2026 00:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:939:4b0a:f0fe with SMTP id af79cd13be357-93a2977bc24mr195763685a.14.1789371864202;
        Mon, 14 Sep 2026 00:44:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm25573045f8f.32.2026.09.14.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:44:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:44:21 +0300
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
Subject: Re: [PATCH 31/31] arm64: dts: qcom: sc7280: Add domain idle state
 names
Message-ID: <yf3lksc6cztulduwnl3bpw3p2gto5wk3iwmvdvpovsr2ry2wm6@wxqotyf6vx6f>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a5de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX+5uq6nF8jjaN
 WMOdYbmIyX2CbL8TJOxnep6G3lw8NqdVarfanjNJBRrRHqlS+ysKhgq208ni9N3mVZfN+3yUMhA
 vsRuERQzK/bTRAbvOaDcBq6/E8jgr7kgk5Ly/JyyL5ROdJXCUuPu+UTyF8eJVTAbBWJJZTstD7D
 f8z9CWOx0lZlWdKXmQj7K+JSkCnnkl8twy+JwHphT5T8DbKSqq2kblWkGAYUpt1aWv2RDOjHn2m
 F6wjBCWS5tHknTkadh2/rNVqu6LKK2Qu+o3DSoNZr8POYtemoFlB4YkH+dCQMH7a4jr8OSVPcDb
 EWMcYRwoXDbegRKzy9USVGpcrUZHvw3SXX7rK/n9QFYOuFJnpUW1m0eKLTdcl3wXKrbUgRfAZci
 VaNKySVcqziijbj6TSgyjtNyxmrG/Sp1L4eJPs8/m79PHEPRIzyH283Mn7HUCRpvB5lrZRzr/Q0
 FOHAWnBK+p3H0aPqZvg==
X-Proofpoint-ORIG-GUID: GqBnFFSx9BMeojYunFszLR1o3wzpHMKK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX8AuJ+YAFtXhZ
 qvxtnL2AlcpCk/BlmTLTgsqvt/6H2w3mp6oH1l0CwzSqTOh/6R1xp5LtUAI77rN05VhyeQ4NkK2
 ICaftepEpiQQD/hZQu1Boed1M2MW4dc=
X-Proofpoint-GUID: GqBnFFSx9BMeojYunFszLR1o3wzpHMKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140109

On 26-09-14 12:30:03, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
