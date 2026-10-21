Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601690;
	b=A5X3+gubnU3JGpW1fdOzDlC2jz2sZavFNHh1kGZvGyTurOxNFBhaQXCdNEc2PVRgsBY9
	 iJ3fRDxgkfnLdAeN8fhs6HFdgVpgzIcakMrorQDBf+qqibCs+tTxd3zGsOfvA9RcArR3P
	 NqfA//JW3TI5oU4JKAgqpiiZgSfUELhK6YYJKuDFr8Fwim0IvKFmaoUlwJm5sPZzGeCMY
	 rZckTBOSrHuHEu4uF+xToM1ahEUpGrc4fY6LgWOSUxSe1xT42s2Cxel3hQv1Kai0DSDWk
	 aPuFG3XbJrPCCxB93JrvwpVhSXVYMCda1/GMNLtVemuxY8TpFKdiFclfx0zYqmfWyyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
	b=pih1x4DlqS4E0qTzLBIoXSH8a2wTggW1Hb4XSgB/SgpKLuwpgLTG1z781ruzlMeOz/hG
	 kEDAG3HtZiHx82XdvBAzYnqkf1tVxV0nyNxLZ9iNSiOKaR0k2jaVn7LvQygI7yrVeH3A6
	 oZGJPF+hA83cz+2482E1wK77yh0vI1ARXjaU7y2S/pxWDKctQDpgkftj7jigwbQmwNuOd
	 MeuKklCRzZ7l1C+oLWjapXU/ae+B7oAzPEsA9eutc3g5rrW9oaxUhz05EOlCINggCKOJn
	 U2UeSABq+QpD37QlYTS8QBU9fQP/FjKHfCTUp17AfJbFFXAnTp3dFX4Fff+8xVfciJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb5Sjr7f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9LncZzT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8499606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8499606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb5Sjr7f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9LncZzT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG3P5R900377
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jW94fUrEEV4vE96KzZHOt/ck
	ZsK/1E1HYZRarmoNLtw=; b=Nb5Sjr7fQsdtlMvWGadhbbx3FfICmiY3qZWMQ1LR
	rPC6Nx0aPLTss4+KcMfC18xcR27AjWgk02LiIJzH/fJrNqHSEsfL82yBDe2k4t5l
	Y+wO/oUPaiQiAM1Wd/tU9F9NcwO1iTrOva8UJGlyUPIIqcZnLJIc3vdTBumNBFk+
	IyTrLskYn+Uh+yKv27V+235pxslX3uLVkBB3AQoY6NLW0WLzFMKmzQyOSdR+XLDV
	BOPF0foGU9/rfSc1TkeBaWUx/LjUeMHBZB7PRM0or3Ker6wvujp+z6hYDwLnWeaQ
	X0cUfmdQyhAl9t3WQGG3iDbF72jkEUWbihRHNZ6r5kkr4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2g7tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:54:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so209976585a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601688; x=1793206488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
        b=L9LncZzT6NA68yXFmbG3QtWg8G7dbfTxZT8nhdjnRUeSqSmCcUkLqQS8g1sMZ1ATS0
         nBFc4auF4YORLBoomGt1unfu1m3rOdD1f7xLlWpN1x6nG393P3JTmx+M5xU2ZIFdq9F2
         OfwG5gun2frbrIm9CxfUKtoguJq3NAZ7TM28YeUzh/gBX5qA4WovBjM2GViDgNb67uN+
         tcw/beAuZ7QuR1hF9A54sDv2SaTOYiqPn3j1bp+iMXv8ZUs/xP9lNkBCO+pLezqmZNo/
         HW6gd1BeoXur1oQx+qXDPDDLDgGw64EftZMHfLCYp1uef92pDcSAgiQA4vhZpHLcibBI
         cMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601688; x=1793206488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
        b=2pyDCH1ZxV35UPjGsn3Iw7sNPf4tx4FSQGKh7irD/jnJpjGWUxi+hDWYS+mZy+ng2f
         MkAByUBY46+xv6qQSYluFuLVlR/VU6n8Fchn5eHQCd6SAP8bNUWTWcqfKp4lka5bsg0N
         uDZEbgZ4x3S2fpEfwXUS3iWoIB9IWr2DHjTt8T4pcjugQi8TOMDH0zrFN5qocMBH4SOp
         G9PfgWo05D7fXmCL4apZvMAFM6JBG9sv5WACgKiWwTwET8X9Whp5IV4xi9q6my7VwqTw
         LvFSgwPESR/Cq33ih8/PvatCO+ES4O4CAnAuyCgSDqwbWYUoIgEGHT/4LQCi9tQ74DEh
         G/0g==
X-Forwarded-Encrypted: i=1; AKwUvByKzrSGSnD+8gpQ5YHvqySZdfy4hGHmPpS7sDsRRftzHXXO5C0c1WX52nnABvN6uHgXX35eoVvAbckK@vger.kernel.org
X-Gm-Message-State: AFq9FYIKbqIM7a9QG5JHZoSAXZTpXckwPWV2R4qtHttBLvi0o2jn6Fl1
	FbByasbGljeVAaNMqtiMZP9dt6+yJtybk06ozYqEERQ0DFxZw7rt/bsk2uIX293/rrD7k2rTfps
	GGXFzwoomCGIeyfvxMOAhXMkK8WghCQ2czZ8710gBCUXZEDFsbidtp8JwXJ87rTwQ
X-Gm-Gg: AYBFou0kyJ0dyuQEDsVFrEopLzE7nV2IfSDPhkCXh3Y+Za8DIAv6P1/CuRIa9h5lAJn
	yldBV30RuxMzfxUMkNcE5rVBKFywN7IeW3UI7zcS9rsPFgzaSZdix4gCmwRy6UgXfwmE4yT8xIQ
	t1JO1qdQdd2NMsYL7rxzYCy2k/+JaDjd0IAq+iIxarxLFzJTAKan2k/KVJ0ztzaafyYs5xh4o5Z
	NAfigkJSh4OTN8C9iRNw1RHVfpBbEtsTAyUIgPoojqLeFbXwiTkTAYGcuxA5Av2z6/1vGv8/5mF
	Fble3rZ0IAec+dKBL6MzWl6kf+WUde9w/amPQa3W0JPMuSLWTqvwFmxKctA7JqZd97R4Uc8KmbZ
	5HAR9UX9GcY2H9eVgbZ4u2Kdm0hSQ9HE2RI0S75ZEKAOSGifVoo6BkIn8kJiDLPXfI2UdffafyR
	6x+UfwR8uHzRzB
X-Received: by 2002:a05:620a:4143:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f57fafdcamr558946685a.59.1792601688090;
        Wed, 21 Oct 2026 09:54:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4143:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f57fafdcamr558939885a.59.1792601687400;
        Wed, 21 Oct 2026 09:54:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f68f1a5sm1127421fa.40.2026.10.21.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:54:46 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:54:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
Message-ID: <i6etkqkc4zqoex54v42b3m53eqa2fvphyxglhcljk3wjr5mvit@qeuvxlksfeh3>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
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
In-Reply-To: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX3xWwcRDuA7k5
 OWqmU0OpFwm1vz/cO2lYRoioh18RNjtYcP2el05mGpHoRSLxrYWc//r8FNalbnOSSRsd3isc7B/
 K9d4dqsHblDzehSWmqQFvK4U9cyOyIE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX6ZWltCZXtDnt
 XlGaXUo1ZvkFg5nacczbakZ7h+t679FTcimpM10v59ykDMlvA5bVwYwxaP31Ylh/mzav3qWG5u5
 VK8wnzXhFow9CKY/sd5n1z6pJgriwrnvGVLJLRwZ125E5WRX8q08SBO0Mm+2KThRBedxchaPLtu
 fE9LqN2QgSy1U08ReSGWcfTsJQqBi2FwXw8vLYB+OVx6+479g4I5kB5tPO3F1iY/USWcSaStehT
 492LXbKzcuHTbEJ8qokQE3xHK8C8AmoyMIGmdutnUtTQURBLtUfi7GYTXU8BcUoGbSQfCPDHYfE
 4WYA+pouD6tCg3P1/ApRKcGca6yyB6AEPv910siZ87gn1eRwLBeRsLMY3Lf3ty+D1IIx4MqHRET
 QEHpHDUukJ2BJmljFMEGGTpE6DWtKqmg593whaX262vD0LdCfp6PvL9R0cy0lldOa4Ha95EZEst
 t0xBsPI3Yw4HPhLY46A==
X-Proofpoint-ORIG-GUID: 01Xmv8Wdhp3f32flcD3QzF189hVjUrWn
X-Proofpoint-GUID: 01Xmv8Wdhp3f32flcD3QzF189hVjUrWn
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad8ee58 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nKfPptvIfco8BJigVBwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210067

On Wed, Oct 07, 2026 at 12:20:44PM +0530, Kathiravan Thirumoorthy wrote:
> icc_clk_register() assumes each icc_clk_data entry describes a unique
> master/slave pair and creates both nodes for every entry. When several
> masters share the same slave_id, the shared slave node is created and
> added again on each later entry. icc_node_create() returns the existing
> node, so icc_node_add() hits WARN_ON(node->provider):
> 
>   WARNING: drivers/interconnect/core.c:1103 at icc_node_add+0x10c/0x120
>   Call trace:
>    icc_node_add+0x10c/0x120 (P)
>    icc_clk_register+0x1a4/0x214
>    devm_icc_clk_register+0x18/0x80
>    qcom_cc_really_probe+0x4c8/0x514
>    apss_ipq9650_probe+0xc0/0x108
> 
> This topology is needed on IPQ9650, where the silver and gold CPU
> clusters both vote on the single L3 clock through a shared SLAVE_L3
> node.

If you have a single L3 clock, why do you need multiple masters? Can't
each cluster get its own handle of same path and let icc core aggregate
those? You might need to have a different voting mechanism (i.e. vote on
the sum of bandwidths instead of voting on the max).

> The onecell table is also filled in registration order, so xlate only
> works when the node IDs happen to match that order. Size the table by
> the highest node ID, index it by ID, and skip slave creation when the
> node is already registered.
> 
> icc_clk_set() also passes only the requesting node's bandwidth to
> clk_set_rate(), so the last writer wins. A low vote from one master can
> then lower the clock below what another master asked for. Before setting
> the rate, take the highest peak bandwidth across all nodes that share
> the clock.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/interconnect/icc-clk.c | 45 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)

-- 
With best wishes
Dmitry
