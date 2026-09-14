Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA73F39D0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371791; cv=none; b=O2NsHg5HRBfEEHBGc6qFq4BeYN4Xm2/vnsBOvp7Tl403z6WrwDrMv0G1miC6YkgBwipvZOylOGWjM3zvxBjEeAo9s2c0hwgWZ+krAOGxhsPAlWR6Eocyj1xg+iS++53rXVcWYN+hmkFGfJjgnvGyR55j1y0FtjCrbgMP374yBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371791; c=relaxed/simple;
	bh=ljHtDQyFU2tg4WF8xZYYgdWm518WsXPIE8Ro4FeiNhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8lt56va5THBay5rYCUS75BKZjXGhRH3Bk4hShmdQLXzPCxyDgfEvitiXwfNQZ5gcENlbkhM00ncSTmUWm0bw93dVHJzFe5/Dhx1CRZXMrRe+XLVZY34lpNJJkJwfvUW5p52zur/JzbxEtGGyNZa+VBSK0WvHpZXuguB449XNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbW41ToP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Owpijvz3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbW41ToP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Owpijvz3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jYvV4059350
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sj36ILgqyvhrxLK3acAns7/I
	xSKN/XaPnzARkbVNGeI=; b=LbW41ToPGyMJ1uwdWSUVonOYBXMewzlsbs4Y5lKo
	cf7JYcuF6tJLCOtnUhhUZCGUHiv5bGNQv6tRLofAJpGyfrXgvMjwWYlrC8g+8ghy
	QOQaRAsrZBXfIPPvv1h11JcdZ05N6QqKcgL5UvCMDRKZwdy15cHWVilTaN0jvdEH
	n2UKsItKzI1rDpJe3ZoSqjy9hULYz7nTU1OPOUR4oinQ781JUyjF80H2E2DRB9HO
	5ANZAkB/C5GvUls7DbA/5q5YZBqr4nZDLCEd8g5aiFMUSX2Xa8kGkjHyT+s6cHAW
	GlTqvrNnvuNPuER4OhYanucHHP2lWocMIisfdZYAqGrECg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsscww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9102f07f2fdso78234336d6.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371788; x=1789976588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sj36ILgqyvhrxLK3acAns7/IxSKN/XaPnzARkbVNGeI=;
        b=Owpijvz32PTdbpC7YTb55IayY0wFFzyGO6wCEi0chXzfdxv3rak+zVGYpZGgpplxk/
         n8QLhCNPsaAsJhk+RPcocUQc3sRbZ31L6IqasexGca1/xifflslrhgDH+CX2fwM/dwkA
         8QyOjCTCrwEQj/0tuA4oaj+kCVdh+TbHKxySlmkYyV5v4xi/3O7ClpGJheDqm4JTY+rd
         XIO6VAJ1OGWVcimcclTFbYJfDcw9mcLHb0d9Tlex8gHOy+qtTtiq2iESIxhy3vuHE0s7
         3cR1uZck/vR3dzcW+D5jMyzv9yePdL4bGp7Sjny4abZGsJUMtwFJYyjXYUifXHXA7ba0
         ZLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371788; x=1789976588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sj36ILgqyvhrxLK3acAns7/IxSKN/XaPnzARkbVNGeI=;
        b=fxPax9Dg5+patMn5lG6WPvoKqj5MAI3vVmNovTFjXWz9ilEVR0PtZPGkC0Mlpr5lYz
         18zO8j7TLdzQZP61yPK+WKYlqTNNb+tuZQkvprJFz1u5TJKF67VQEHYh8RqQ13Xg7Pwg
         DCGch4Ogf4zbc91umDQnKnZouAAWKqVd0v1QIhcl4UmFTdb5JtboXGMC4JcE/mrGrUKi
         na9zAoOrUqIgqMA71kFNsFD07g0aW71VBk0OClggDZn0ALS8iO8uORyixh1ip3N0/7om
         s4HUA0rNtkwlPdZGvv2H346B/696JO3M7IMGtnbr3Ehe8dR6BX6WbzBtKxaXuVSewEtw
         nU3A==
X-Forwarded-Encrypted: i=1; AKwUvBx6W5WJZ9OF4+5XQDiFKb+9g6Sj29vi37q2yRlcmr2FyFsfF0+ykwEnk7g3Riowx2kZPoj0PMeN2Z7N@vger.kernel.org
X-Gm-Message-State: AFuF++m/jW/agX70RjS0EUt+pNQUhZUuW8gFh0DF35/qYMkO1beTPrMK
	jmYBZq1B/7+YkfM6VpVd8hesQ2LFsNZhCYoVLbm5Pu8sQ1XsmjIfbrW7CHAmYinh65XhL8pEnYg
	CfI6NQj6CiifggVzIgspj8vsNHIGZXdJe+pEV+n5rfbajCTQSCoZ1LriataGgoyhU
X-Gm-Gg: AYBFou11L8cjtWWMkgyCCxCu9bUCzujVtaZ4JaCRRCkd9hLPb3EIUqvZc0kwARnFL2U
	meOsp2hGfC64wEpfbGBefXZZogS+VAl+kqMmSNr7ohtW5Ajy4pkXnqz9VPJFTAhTnSCFpTVkEya
	nOBp9ARXYF6ohy2w2GS4bhKBq4eUUZm/JeGJwdJVp7sQkq+z2XRn1uwDSHE/A67Y2L1CQ15llPQ
	GhRfc4j7+H+IR7KBqFjs64X5IcQXe87axrqULgEFh5fLNIlg2UgpPcpQNYbpWOUMpT2MynXYY0a
	35w7CzfipBy6ZZv4/4vNYKUVvlqlMo7a0hFC/tihWtJCF6wvBDUHxyKx8wao7oDV4bff3AVbiYY
	3CmOWKDZsV+XF4w==
X-Received: by 2002:a05:620a:2814:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93a185a63a3mr564005685a.11.1789371787999;
        Mon, 14 Sep 2026 00:43:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2814:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93a185a63a3mr564000685a.11.1789371787024;
        Mon, 14 Sep 2026 00:43:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e8d1sm25205655f8f.11.2026.09.14.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:43:06 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:43:04 +0300
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
Subject: Re: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state
 names
Message-ID: <3kgqogj5q4ndryoj745ujrphpyztihmjp4f3otdsmso4pdkqzt@n5s62g3fkkat>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXyKab99DW6FGz
 FeNs3afD6wQq/I4c9+xg0cbHueWqhZsh8CKOpsyFm30kHjm2JlChk/pExnKylDtFwneV9TAK86i
 xaqzeUYk6kRLv9lMWlb+jeXdeys9eov9syHq+qXvsLCnCeXiDu2kh3n3DLW3ViMAQpu3LjlMGId
 TcfHYntnTi3T/VqS8YagaUc8H1c5+qAUGtY/oT+BxsTQBJG1J5oUbVTlqMgciue105lOZAH8UC7
 y7Ez+l776lyPH2K8ZLxOSWfDusN5oLIsLOuec2a5qG1fXIWERHciFEZ0sr9T5FLWA5K0aM1PvA8
 SPBRWkW/Otjf4ImHgZSrM5ZCyLnIctE/neEvZzn/KsfuMfxFbMJBiFqJU32ZxT5TJjsPyiYTWV0
 /SV0ittgl15Z+0DOqIIYVg2Y7ORBVt9DeCxph4mJCT/AOTtlranrs9j23uaIqWuQtaeHI5N077F
 kVu9+4ZkFcSUDyX7qXg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7a58c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 200bihzqBECIxoneVtrR0rAoQRLgoYzw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX3efSHpzILBx6
 e0+Tf2B34HJbAuKVtBJ1fJOXWIw1r7ZnEWsDnNXRSAJR28NcDSE7DED5cXua7IOREqHLhxNmKAS
 lglWAANQHtHJqGj/D9uFzQFHxd3EyqU=
X-Proofpoint-ORIG-GUID: 200bihzqBECIxoneVtrR0rAoQRLgoYzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:30:00, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
