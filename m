Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE72E738A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108735; cv=none; b=faJH1vOLaXZLd5NkDNlz29Vwd4lesLXk5ne+iw3jqKuBOoB4cfRSutPo5iTJAuJCPmTjF90J38Iwk45zky7FAN8GEboy0mYhZTooTuH7Hr0ulKiwF+3300sC3SZ9C/8BU4Zx7SteI7a/g/XMhYX5a5PFkADLANgOA1TYVwHrTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108735; c=relaxed/simple;
	bh=ASTkN2BxQQQEVrM1YVxZgKSUKV7FSgAXa6lWoRmkR9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPW5PGfYQM684eUlP5IOFXzDK4T63GmxIeIOLKtUt97KfySPtDfx0MyEMj9TEYrJWtmCzzbL34UXJJs6ItzM7cwruw5EBB2D62OCWYWLyG7f+gkrjDOAmv537he8dwh6eprlvyfXQmoGOco43kwPg7m85GnlqcYPgRervWcj0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZflAaZPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAP7eSeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZflAaZPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAP7eSeS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Cwt368041
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/lojMJZE8vqIlCAidGtcN2P7
	52zM4MGMFG5QUlObod4=; b=ZflAaZPll9AMQbR0BBvvxUbdaX+bP/TgeV017vD5
	sv7oSuHp0JbB5DUZJduCGxNDHXny3b2iFOvc7DfElAAirIX/fwbHY95c733kcv86
	h+H7tfidYIgZ8bWcsLjWGNXi/YxS8qumr07fJDaezFK95+WISAEaSc75H9irJUwn
	1OWS2+UOwPZkLPQt31hGGBPFx4zBNPBze0L72Jgo0sVkmyodFoX8kGFayT9ZMSS9
	heGVcYNVs6thsNELIC7F7GN7GkYcrAYi8M5VceNLLeOeTWfoSar/BBE8tYmNCDj5
	abVFyNWW+FXcSreM+XiofM+MwBm+Ubi3brlDjWVaw2F4wg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntarbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:25:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so139923e0c.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108722; x=1790713522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lojMJZE8vqIlCAidGtcN2P752zM4MGMFG5QUlObod4=;
        b=FAP7eSeShKNz/dvd2XNryvO8JIrZizHIdZYwytzlLw0AtCOMTSXK0hcGL5uIJwgSvG
         WTeEnuASwVrFDLck8F2l9OmhUKdNQsPDjADfoQfdxB4midh3mRdXXqFG3w2RXHi0GEd1
         Zo2mKGVxspPSxNZjJzNzsZ/aZonbt/uLUpSRoPMfkg0X/GHcLmLkvE3PkV8ap41cys9t
         p4DcUoSJE7QLy1QKB7DMdg7M9WjWsKo39Ce0klMhKdx6xQFR0JoK36gzvCGrePdO1Lr1
         A0+8XFoi1syUnDScHz7Hs7v7Ask1OzduqAEo1e55iYzRN1nWnw1Ag+Uh2+s01EGS3arg
         xHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108722; x=1790713522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lojMJZE8vqIlCAidGtcN2P752zM4MGMFG5QUlObod4=;
        b=idX6n5EK7vfRqIM/SdQEctGrgCU5dn9nOzZboWdSgwR02pXds1fpSp39u1hTetiwm1
         AC54BaPyMvgnamkAHkY3yTmeFXXVbJFxuAdSes+CMjFLLPMDbB07s2XSRcUsPhnuNlG8
         LnSA26qUGzjRS8D6A39DJ8XqM2nCFSVdgC+NPNH5m3XzZnQBkwUctcj/bwCKlUSltn/5
         KwTv4coyGCL02fvbGmYRUfyLIKqNfr3eEd5pbSySdyhFSsOVuVyPNTa7d94cv5zEj4qV
         WI0MsSESdUVCCP7oxCDG5xdh9KmwfDioxhKhr+HbodHvQ98lqMXCzDyV/VEaHLN/WVMD
         y4jg==
X-Forwarded-Encrypted: i=1; AKwUvBzodtI5N0jt21HUWtsrPC1Cn1hJG8oA1tmluutIvFP5vOO6ZAV5JfRhclhB/eU4PYddyP3yDe60OUCA@vger.kernel.org
X-Gm-Message-State: AFuF++lm/GVQ05zJB9hIQQf4EWfstukL/lsw6se12m7VUmc24dNfWJ70
	ydXg6wYkWvQLa+pciDpA/jv1wcng0oHjpQgRiCLAvLN2Z3MjakCa9R51FXBbA8XBnMEMsAJq8OK
	BRC4uX/z9RqttqpTqe3AJdMXNCTL61DXXoLRUge7hHsILAIEZHjIJ2PZjzlZZL2Qy
X-Gm-Gg: AYBFou242Z+EoFkh+Wlalj5/6R0r1MnDsHOC6PyMTuMR+b6pYpbC66k5RexSeoD9kee
	PNb1ph2HKt0bOre+AHrWZGp8x/JL/JCTm5jKb8mWLCemCp0pLWafqjDkWFsKrJnpwqrOTeqNs/V
	HDwczJBzyBdrLNDKF3iVo3lbFvIkOUbw/I8ggaIBGkoROYOWuL7h5ReBPfg2SXZMwG4p7/UHQaY
	n10YHoNSuidXfGJp93TFJR28eiRKn1esvKO3tbfvn5cTjirCmtSysyv51CbuiUb6nHDhxcNeCyR
	vZ58gzpYfCsLkEKRMWyvcAIKMCwEKEKwA2UtQdBmsE7hOdXPOK2LMAWmlmUHuqU39LE2kZopg6w
	VssM6469WGkh7A2E=
X-Received: by 2002:a05:6122:1d91:b0:5c9:c60e:f4b6 with SMTP id 71dfb90a1353d-5c9f16a7a43mr974529e0c.20.1790108722226;
        Tue, 22 Sep 2026 13:25:22 -0700 (PDT)
X-Received: by 2002:a05:6122:1d91:b0:5c9:c60e:f4b6 with SMTP id 71dfb90a1353d-5c9f16a7a43mr974463e0c.20.1790108721632;
        Tue, 22 Sep 2026 13:25:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868266822sm1076173f8f.5.2026.09.22.13.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:25:21 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:25:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
Message-ID: <wkhpoogmpf3xuoq5tqpxznoqvkthfquupki4pjfdcm6c5kwm2t@fr73f6udyvou>
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XuoXWtagLpgDlxG-5_oilo3eTT9mDOzs
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2e434 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aHEHYAZx7hSDT81ZUAAA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX0gaV13IC7hdM
 AN/z7Rkz3161KuSyY/ROye0zFPl9Lg1sggC51h67yhJJgEHBMHO8b83oWI64D/DJjMTemRoIBbO
 lFG/vPgL4XNzekUHzxdLWRrO4CMZg3DUu0sW/tBLgAfiDrTwxu14RPPV/CK+sdngdTtEDN6T8jq
 5+7ADXX40JI4iCkUczWonHdWTl4IS/HYoA86mzp1dIKE6EZRh1s5irS/nutqHx1x9L5TzAewVy8
 oo4lIZMO+SUq87wQMeYhLdxdLXaDSgMWnZTbxnC1issvQ2Wf2Ql/Hxv0lhJY0nz1r8UzG3n90WD
 etctY3Z0oFR7P45VGiVf4tOnYmhtEiZxk5qDMiflaE04UbYrizawEkMTRkPXoe2ofVXVQM6ctim
 9P5Pj2vNcn7yN7cQFZK3rf/yvaae2ykavujDUPuGhI/TPcX/zOiNYQKQA+T5UFszU1BbqegqBln
 klhyNl4Hm9QTAQz7L6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXw1kZj5/kkh5E
 ZHmw+6uoZvTN/zSo9KzeAJdUoICRZ7K+OqQKJvhp4QOhVs3TNFgu+7YNCMwbLd39ITpVIYjmq+D
 lpzjDTqhzU/84fIF5zMU039UYbE2pSE=
X-Proofpoint-GUID: XuoXWtagLpgDlxG-5_oilo3eTT9mDOzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 17:34:46, Shawn Guo wrote:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
> 
> Add the top-level pmu node so perf events can be collected on Nord.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
