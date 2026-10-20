Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498441;
	b=DiCb2+aAAZH9z1BygSClKF1Rcnaq9aIF1e4lQer80XwMaILLq5LOnwgcaxXuBeTsC7oD
	 TlKrdrbKQuAnSDFmU5ZryNyBEk4chswne+pUQhcYSD317iyGLqvzg1Ugi4kmJRvvn5nxU
	 /9yh6+IhJ1vMFwj1uNRSp0CA5E2F/x4rFsYuB2Y7YkQOOdyVo0fi/flibZ0nCcxkKeT+k
	 PbWKdzutFx/5W0HRvYQZkbXsyyOuhcQNNMOAAAkxv/WbjYrP3t7zR38+BIAbk638UBgjt
	 8jWy/IP/MtAmD0Rmi9ICTFiD7TePkI7wBWFN55C7hxr2mFtBTPdiTX7pW40KeLCF22Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
	b=Hn0mxGuKtsVI34qXdjMuWy+umj5hkpPC/PDS2CbXFuyBYOrgd9E7+VVE+aOmIz9pjTm6
	 XvsP2TVrNsl7/AP1IoBvbNmNkIqsC7P/ykC+N+6kc58HW1OerZkiovHIX7r80Wa28FIyV
	 baIPP81vJWb/5MTtQFo7qoNCi3fczdL57OzyMFZZ3eH3ITrwt1BC302dILtUgWtHNJSUk
	 M5Vg6BVHWJ5mBfBb5bdNWjWp55/MxXuDbv9a22LK9kG7Pq2kVT7TwsCzUyf4Afmciy1EN
	 kQCmKgXN20Ptm78O/6MgCjZfgOD2yw37L3cjT4ux3kXQPKpNrjZuoBvv7TZAJ6ZwWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/QTEL6y";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl4lF+r6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9192C606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9192C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/QTEL6y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl4lF+r6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxONY2524940
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W2q+lbg8FZt9W6yyGG9psoCN
	ajA3HujtwITzTDuoWFg=; b=X/QTEL6y+4vBfavAGOSbpoRzqkdjB4AMtmucd7TQ
	EHxjN5AZomNfcdGUFEL2814Gnu98WBWmjWOJrUecRUOZttxweWpASb/dH4PlCN65
	wiL2nlyq0jeNzlVobS24UwiXJbxDXgeI3TXrvo5f/DmzNvSRQEv3JpwNjn23JFb7
	G7KrjiyyGjZ1gMq6vHDqPEiHXk9R7SzxC2F1cEqfVJAjAztNgWfhsKX88RmSEzoM
	7T9xy04/sMVWL2GTakYxrpYxa3ynLMRtyQcI/PDiVXGZ2xo9tau3QcObv2DkN5FX
	63ii62l6n71CtRIZ8bDSLchBu3WhlgAUNrd6l4uzUhpUuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2d86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:13:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so592129285a.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498439; x=1793103239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
        b=Cl4lF+r6Zv+3JcyDHBOtFttfJ21n3e4KnH6ZLm7bWFfC0gqCTDb/Fx5HQazHtxncfG
         /w0dcumvIaQ2utxrHXOrG/C3yHCQ+Q4kOvC+QxPbuMJWKBJKEn6nfWchpF1rzbsDQz8t
         0Flp7lJ5AyVhHublKLuVGnOTMw+QHPytXir6T9UPznu6OXwvxWVWvwXS1eBnbIaDFe/w
         SvP6ZyQKbMVxz1igVbOORgBsUgOz11644dSuQOGfOrI7jWi11FohqSYSoeDxHTdBMl+M
         EaIPjtSUd9iWzJw2giRFMbHZfuGpH7/rlOyIy6W3ZmnHgyOMY1BB+ZihQGdZcdoet0Pj
         aHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498439; x=1793103239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
        b=RV8OssN7yEuDXW6yHBtKr/X3GWZDQPZN1RyK34qaGwapK4pHI8+wlmpRfEeYVi+jUw
         hB1Myo1EOYz6k7YCC57FlAFMH00rUV0R4/D+VjZk0+mskXNg55JTPUk20c1wjMypwBw8
         3hit0DRdbnRVA8o9/o2H5gRkOLGMvr80N4BHz2mzqDVH3gYkuNohN9BSqpJJ874Yyb4y
         5kADyrj489tNh/AnZ2x65rA/cyTE8ffp/Qw3ogI9RdaayboEQ+z8YQNLglfgKqBDW39R
         LPyGKYpBGeRbclwNMwoDCKJQ+zXC9xxNvBvHf1ELzreVTdoHMlpKkjzIouFVb2AJplDy
         94kg==
X-Forwarded-Encrypted: i=1; AKwUvBwTktGczb6KunrlMEoa5vjCWMSh6p2Rfy6udZYmtH23UEazGl+G5QjVvY26DBUWjhM68kFcvb7frH3w@vger.kernel.org
X-Gm-Message-State: AFq9FYKjc7t/TtwiQgKv+CUbpvcDQ3AJ8OjX66Mh8ibEZdVGGJE/K7hR
	0Gs3m5CUq/CCllk3jr7Z4V52r3K79HOvDDCaoU/pz88MxqiHe0915pUKqxn375AvD+FUhK5tIG+
	Y2+s3ewT4uFIXJmiarFDxMuPg9r4E05ThohQ3Z8NjuI59sZIBch8nn7HiZ2A1dSNS
X-Gm-Gg: AYBFou0+WO5FtogJ+nsvPTCh3hekZgiltmtcKnAjs7G0McJ6s4vf7hM52TcTHtvdkTo
	+P06Qvu/WEa6oPH8g1cbG55z+l8lGNy+9bifh+uGsLL+DScI3UuEfgSMoklPYllJdOgL7CjAYvc
	ldXtUK+zNpeTvkksQMYaQltz6ItC6G5OKOWc5KPHotOgOlkMvZGCzcowMJgtx2D3fryMLI6RtLI
	Lt3xnk5mqrr51ZgSy3rSpe6yx04JADpGghMs9qY3iCTbX1rulGOIIQrXkqIJOM46ODCQygSJu4o
	hFO+RlGXL9cMC2aYrBSDbKMMKuFvvqjMcswzpw/hriOXZfc1KblN+ApgIMZwT9JdbYWv1N1t95P
	eppVE3T26VZoin0bH
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f29dc9d10mr1630170485a.78.1792498438319;
        Tue, 20 Oct 2026 05:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f29dc9d10mr1630164785a.78.1792498437609;
        Tue, 20 Oct 2026 05:13:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm6351362f8f.42.2026.10.20.05.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:13:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:13:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: lemans: Move pinctrl states
 into lemans-embedded.dtsi
Message-ID: <mwi6zi6imuay5dkfrddevix2qorvkqxvvptdywv5irlez2yd44@wmorlob4ygjd>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1DBgPmGCUByHhHyP10s-wwNwES6TuiWA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX2s7tgCJzHq5q
 M/W+98WKDpkFS0i5AzVmrqQHqmfxLLzJwOU2WkhmtTdHePFhfxtgmSDMDobgR3A3ih3XD1UTfwf
 ES3huhuO5dcOlEVsRpaOt2KPM9Al5hM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX9bs0oZCEYtbK
 ny8nL4u6JQtF6kl3+wUSaULGZ6/y7SogVATpw4zjDvvyuxJdSE7WdZZfbK5yj6V1zu/KTEbtZLN
 fogPebsIwU+lXO+F0mbG46O3dS3TuKQULFsuEaBlgBZ5eCjYFAftV3Oi+EgSxuk3FLQib09hIf0
 TpgExGJagzscjYLcRs1MkdKj/8wpxyx0NdAnqTJ5z2x29bS1yZsx2dPfkY+8iFjmtcDB9A8NNVk
 lKA1VChHm3elgBc7+LsGy9vviNbyDifgkOMMUJxZ8UTnJGulDjuuRLUFlPJH2avy6eIO0PqY9Ki
 FLXr/nCXat+el4pUAQXnqami+vRuMklNqPEu9gBrf0qxq2sf2ixNIYgsSmbrPTAEOf2hnWjaNyJ
 /O2enRINiL3Xxks4HH45r7SfCcv79WZ3MW4HmIy+7Wi0Xr0BlUHg+uUQhgtCh2umqftIbEMNvIf
 QH1OTaMKXBjJUtHsAdw==
X-Proofpoint-GUID: 1DBgPmGCUByHhHyP10s-wwNwES6TuiWA
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad75b07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1Mba6klkf1WT3IQPbzUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 26-10-15 10:37:06, Shawn Guo wrote:
> The lemans.dtsi will become a base devicetree shared by all Lemans
> series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
> they are used by Embedded variant (IQ9/SA8775P) only.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
