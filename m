Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9213CF21E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371537; cv=none; b=gOAtl236BGg2Nw8tK8LsUMVwDkV2NyBSmOAG8sFHHL1jXFayjLsqY+dOEO4Z8+bZj0wihkcqJHPAPDSiZGs2mRiaaYN24J5bkDL+AVhlNFVbLMmdm/TN1g1SOVLeWknkM1lH6cCJ/OX2XA+5wVdXEFSFveyVlUtcxP/quXInHoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371537; c=relaxed/simple;
	bh=IZAQs5Mbd0VHxeZKpUFNEOb0Cu6bsj2Yfmj3KWn/wQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ir2BWvWJDJ796Bvsw2gIzjN3HXyPAabU9WxA0ORXQIeFqdlORfpQ3xdDDuxBjq/O1w84+0JxRDi2sHgsShXsEfmCbIUdO/tCbbThfNJBVfC+mpCsbpE1iIUTLzzyWbvv6f0DVAj8okezXopH1JZRyfJsVeE+6vFYH9HuG07XiG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyUmKA9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCEiU3/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyUmKA9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCEiU3/N"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2fu543393
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HKYGjaoMC5AkTZVbZyYUvH8u
	rS/boJ/Q+kOD1Piid8A=; b=KyUmKA9rHARHtjXsMn5js4pUi9S8yQ9bUOMBPMQY
	CuSef5gESsVvphF6Hw03GL8jmubsV0b93rNMAZ8R3jZM+r3Tt0AN0JJZdUphynK1
	lHDN0TyM7Xg8xlO0SvJKgmp793FTTDpM8RKkFNEMkBZfKbQRnh8uLDPpI5r+3NIN
	+D27kZAC+BstxTyiG3fV9QfobNxqsshf/HiMODeu7k8OsoElVcY4zysx9/20q2Yv
	nlpyxqETA7GpK3VhzJi2H5o33Z+6s1IYApeUI6DGPHIoQiS1eIVeTdJ3ZYqgllSe
	aYOoYcVsuETD0NpCP5nVjaGbbjcPfRyhTOh4GpzaE7i9CQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09cy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so183128185a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371534; x=1789976334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKYGjaoMC5AkTZVbZyYUvH8urS/boJ/Q+kOD1Piid8A=;
        b=PCEiU3/N4Kjj8XE4aQNJetW7cEZYX81irk2xUJDN2taw+MyIpojU4RhKklOevWfb9Y
         4UE8R9Az7zX8PkWYcYq7iIAOPC7v4PHtDMBNQp0lB+dsZbuCOWWCh75Wcv7fVPgllHrK
         dHn31nfwUYB3jQGRjbAg2zsP/0m/6irGPMF4rTcQinCFv6X/qy3PXqQK4o5xGZXxfoAM
         wU4ebiy9kSbAq2ZW2WFjwS9EgiR9dmulOy4nIFCWQVphpsLMOFanDngLwbrgMedW9ro1
         so+ACJLgvWTQPC/q7B8cNy61v5r8++CZVGPnmeSDozq4OTWdmXxYveva0zd06L7b7KNT
         zI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371534; x=1789976334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKYGjaoMC5AkTZVbZyYUvH8urS/boJ/Q+kOD1Piid8A=;
        b=au50Wzb28UfeMVZp7tr1P+aL4hx22ktpccjzN3Z6LfRFdn61qmuC3B4J2qhqXsXfRB
         eE7tCIVLKKK9zW+XjWYCLNfhghmosQ9QVuFzN3V5r4fNP3BMcE1uIQc/lhspVn/9l5jX
         Hji/eoqvosL6U1Qo02IYdrUIGpUoLTy7TbUmexEl3ekPdM9r3YWT58pNjycS4l3yQiUd
         GL9ZK+tJcOdfQSActqGhY7Vd3LokKG/xIqADoxPMDPXgd8uc1xXcNov9PtCSaIsgK1ke
         O3TXnGc4Cagf/ppyQodhYWELy8p5juM6qdvXQLsU+WFT/Xg9b1+pyXHsVv5s7IGFZY/I
         1cmw==
X-Forwarded-Encrypted: i=1; AKwUvByJTjfMGVrwi34rpsHGoTk+a0pdZRot7VUmEpq00ysxcmqvmBcvIqAKzvkF1d4ctPqTVlPBEgot3Taj@vger.kernel.org
X-Gm-Message-State: AFuF++m9rE/GxuSZWcBGlagIc+m4QrooB2Yo/LovHSMpKsIgcAPmxOXH
	lRGDSbYLtABA6K8GM8OgM5izhnSJG03DfhG4gLzNqrIZfHz2WVYMVRD8VS95gQ7cV2w95inKHV6
	1j7eSEVIfsVei9Eq3iUAVurNPIVbYhUWPpBpnfX3o/6jhFX9U57LtXa7rEpGow68l
X-Gm-Gg: AYBFou2aDpJM5qZliuEdb2s3oBZIqMGujorEtMxnRCQUARikmxjH4+RBt+odzqbSsRd
	h4u5AuwMbSoTsSl4uEb1TBWjOOAVkggIMqB0duIOEgf+8RjZYPYZmg5UC+y2tYJODuweSIIx/4u
	EuO1F+PsvUnxf0+NeVKw4oP3e819oz6jO4VusO/BATNzQPMv44ziF8gtHPzWPj887SsglytSoJB
	jK/5dENONDGShyQaV4FS84PcLvmqF9WLbOozvpfBtMsKk1nFVaYAfF11NQqSMJGtAsoUxo+RVWH
	XjM23Dy/iRB482ZCO3kDSDSO/l37+80OF6qprpV6EQGlyxL4YpJo9EVW63oM1AwOlwgPgpPBkLM
	MpSxmc5q9B2qAS1s=
X-Received: by 2002:a05:620a:2b9c:b0:92e:bd39:9993 with SMTP id af79cd13be357-93a299475a5mr183311785a.31.1789371533190;
        Mon, 14 Sep 2026 00:38:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:92e:bd39:9993 with SMTP id af79cd13be357-93a299475a5mr183309385a.31.1789371532741;
        Mon, 14 Sep 2026 00:38:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm25373986f8f.19.2026.09.14.00.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:51 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:50 +0300
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
Subject: Re: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
Message-ID: <7mxsmfbx6qgzfn7vaz23ylvhoixolc5ge2ie6fer3bmzydwxjd@njd22lbnyyj5>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXyez1AYylg/vQ
 XL1X0d1BiZHZveDnfxpmr2HPQMZC9yHz6851lTZhM499A84txEUQuI6cJ3gQc5ed8frYyatLrcc
 HJ3+GhuFtQI9detfdoNKoTKd3nchm5I=
X-Proofpoint-GUID: hdvhphSf0U5y6D1y2qSEtZeTWMKaedx8
X-Proofpoint-ORIG-GUID: hdvhphSf0U5y6D1y2qSEtZeTWMKaedx8
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7a48f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXywQICOr5qh2r
 hLP/o6P/jSo2Fb29QGT0x/xapDSG9gObSThitHt4oixGznam7pj24IzwofCnZUgAllUTIElzb3A
 9PXV4yYEZfc+pG9bSDa8YOLQZZc0OYVzZn03aMAuN/2X4SH9xncrMjaRQ5nD+8fgxzFQElN5eWX
 etAfLo/FYtxTnyyezIuy1LyBzaewThbUksgGkk3xQ4ennmbyMFsOHbtcQkNgGF3My+w/BE23VLh
 9oVi3Wae0+P6v6TFcOZJ0WdNKUprIqyJMKxz4gD7MromXWpn/6WL7jCYX5Y/KRjYWIRJQMMeZ5V
 RgmbucQkrgOBPWmeTNDGWgZvdhB5bx34kb/yNzrgYqrAA8MfV37K6ErtdxTdEB0J5h8TBh/Tfy+
 QgvoRj3jPWW0WZ+9GyLT3eK9pqrX5OjNJsLfFRvG1FX9/5LH7NiuU17B/yW4pANntu+v9emyVtH
 Q98vbWUEU3FNwCioAlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:44, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
