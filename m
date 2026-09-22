Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155533A700
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064755; cv=none; b=kC1WAB17TiHGl5fEnWFA035oqYImzu5Pcppj80m/S7ZKHQi45o34zbe4fEOinqHyQ6+Dm/hVvMFiuDqSrtWaNxcKMi+lrLHtHf3fDXXrbNmrz203mJRbx/ny08LvfrEnkuFtpfzMQJLIOMHEOyXGc6ZZ1NjTuahpIRWZUh9eP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064755; c=relaxed/simple;
	bh=FzwzCp2B3CQrL8UWS3VMy1GU1joePEyGfnMV0kBpM7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTz9tVljh0yH3hJv7Y9XDRSNh2Q+8zMz6VQwh0ubvrYHOQ8tvQ5UOAzUqdB+MqW3I6pk4TGb1lrcYmnN0InfUnbP92uOVX/UqkSwajereZ0978/ITODdcYw6HiwsZ6pZPRFy1n38L3VI+LBi2Fk90Mx1w9g9zlS+bU9gtmucCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOsZ5kLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvJKamrH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOsZ5kLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvJKamrH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6skLf2166099
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=czex32aQLz7Wor3ZwCAP8jwK
	GlUOBphDFuP6jLqE8W0=; b=AOsZ5kLnNaEZC6jEnx5gtyQv8DV0FjojSlMnM/Qw
	M3NFGOApHMPDWFq/DqkvSgDF7amG+8R9DwLCQ2f4nNIXDUFqq6dxXIdKViN4XidJ
	dAhF36NcPaqZWaNziG5WsVqkfIuT2tFSTCI5OENkHW3HYuw5Ck8aOpGT3u9pREnl
	yONur2P7z8NxIAEqKiZbDzw7/eRzXLrUBsrloN0OQBWG2IlrhfKyLP+ucb20FE6k
	+i36puQkjTSFJm+a+c98k7R4Gu9R/dUDaT3AojxuqhfHTOq0Vq5WRApFP42clcJZ
	wRCR+JUcpYa4maq1gYyHE70LjCbJaUUN5FZroW3S4dJ0ug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetykh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:12:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deda201bcso5266623a91.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064753; x=1790669553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=czex32aQLz7Wor3ZwCAP8jwKGlUOBphDFuP6jLqE8W0=;
        b=bvJKamrHyqSONGVkFNdsgvbZGH9LlRb9qjNTpE361+mBvzAwT9u1PCbslPQwAsbAE5
         gvF5kuBg3mHxyeHcfcKZERNyylW2HOYtriittnZSPvqcXc94CHHClBfKLE4xTKPizRPD
         IMTJU9bCst6hDJac5i9hac/gpdpm+/GElD5lvqguUrcE8YG8jULHLlgzrNosMm/mR0VL
         TbQ+uul+AL6EqKSRNNqbRn5/WJvgOMLTwYVxrSAEnt2fm7TvfxyYeMeAhsQElVCQRLM0
         95kW7BvXwT4MNi1aJnbf19JQXhuUXSaYzVWajIdOGw8umhW/f20Dz5HiAjfBkNCy/LZ2
         vmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064753; x=1790669553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czex32aQLz7Wor3ZwCAP8jwKGlUOBphDFuP6jLqE8W0=;
        b=yALvCqFTv4gYqwweo33vFSfmdbJR7TKVdxGvdyOhuQDZdT3AOZPCweEEPJN5kGb/qK
         qgMpFr3KNXpuiLnwAAHMhzZCJ8z8c+No41ZtH5kEPu8BSY/sDM2aOQAHnymSCgt5Nm5A
         BqfuKNLWsqDF9wcYVeQV84CGAv4DH775h9A6X+4ujsc91lkO/gAEr7fnzmWtDUkkQ+9w
         jnSJ5qc3HwKzToWcLibphZnC3QkH3NVMDjmdCejYG5CI3Zr/KAO+m/CGdq9inmDi8OrQ
         IKhVxILSXCYgpolzYSuFNDULQJj6X2hwp6Xg/gI8E3wcw545RsKS9MaRBDMyvNHRKiI+
         qMWw==
X-Forwarded-Encrypted: i=1; AKwUvByEAfCfogdPAnfDYckaXET04eT3Eop/Qa8+9CmUvULrA0Kz1pdrgel5KjTlAWhowExXqFIbe5cIk22K@vger.kernel.org
X-Gm-Message-State: AFuF++meRKv7ogrpBBbyk+pzm0VBLwANT9tj9BFQuPF8G8cHS/0qmObL
	RBwop4eY3ZTqVp6p76RftIgEPG1RZ3XBK8H/38BGAcuTI8gTyWJGpP5Gt/qlP6n3VG+9RThzVeW
	enNKSDKX3NkjRNTlUb1ffHGlO3SDhjL4VPxyfUcBNLdY9ChEbxjd81Bk7wf0oIIUx
X-Gm-Gg: AYBFou30HSil+aVeZrMy6sWBDN74fmLTjGnTbXsiKG6V511S9LMB2FL2win++YqzIfe
	BNzVZJMvfRkvO7d+T+ztmU38ZgvkPgdJjO6Eipfm9zvy0HoQKznDGX2C9WvNU5dUqxr0jDGxplc
	0105mydIqmwG+J5knuC68kD0csbnx8wcKtpoCfhEDwdgxrrK0kN5lELy/pJzCLNJ5jRDpt0wdJu
	qvHZNMj+q4Jka+y4m+KE2z+/L0B17BYalBEMSc0bTfPzyPw6/c85dQtglVMikGtQwQwReAm83gZ
	uCGeMZ0Sf/Uwl9DiPXg55OHNxhyUf7zwiwR/5NhVUuy2Tv8+VR2iFX4BuuMHjprvzOSM3+CAfHY
	LfFsWXI9W//RpW76yfQj5hurNmI4O3W+RUdmXCqo9WQ==
X-Received: by 2002:a17:90b:574e:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-3a073116705mr395976a91.22.1790064752874;
        Tue, 22 Sep 2026 01:12:32 -0700 (PDT)
X-Received: by 2002:a17:90b:574e:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-3a073116705mr395943a91.22.1790064752305;
        Tue, 22 Sep 2026 01:12:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3084889c88.13.2026.09.22.01.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:12:31 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:12:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 5/6] phy: qcom: qmp-pcie: Refactor common multiphy
 handling
Message-ID: <arI4aLn4GSnVQXO3@QCOM-aGQu4IUr3Y>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-5-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-5-ed05c6e09240@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bezndpCFiEw4p18MLObOZSXRx7q2KCjO
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab23871 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: bezndpCFiEw4p18MLObOZSXRx7q2KCjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExNiBTYWx0ZWRfX8qB27mFgD6Ih
 nNLF66qr/k31J/1i4/VIWzAOIJak/rPpf1Yzk+MVbC8xto46rGWuuEtjhmdNmKFl72YrfLYTlIh
 zPeK7SXx4gDawQurgfhpqs7dxrXbCCx17oXtcJEseB30HXQppr85+ZgSQFcm/kuqv6o338xOa1C
 M63TlsPHUJ6GE402y1Iiz978oIN4To9wf5bHMmO0++ZmIxTniWOAtq/105j466XiX9F3kSA0xEE
 NoqcZIJorC/TTHqfOpKW/ED8ll5Mi6Mr/ZjuVwgt4AITZe3LrFoNKLIUzmgtGtJx9DsF3Bonx9B
 JL4U/icLBp82XlWzF57RNXnjaUi2318nBO4TYObXRbfYDO4BVnsagGyrcNnWL6w0+4v4Eq9YXlX
 dkrBfLxdAmgvx41Un7wiN4lNHw9gWw4kr2d1F/PlNZw+v/Pa9WSy4F1nznn4Tw4uNx/BaWjk4PD
 M0/B64ftQk9AahhWBCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExNiBTYWx0ZWRfX1nhsd3kJN23v
 ubglYaT8eqUzucksmSr7xMsVdfoNqSW3dH/beEsrxxoZ1oy88exUSRCaXeq8x897ftI13rxzpHK
 HpHeNM2mMi/43MHm3FPK7CMlHZ+kz5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220116

On Mon, Sep 21, 2026 at 11:07:13AM +0530, Krishna Chaitanya Chundru wrote:
> Reuse the existing port resource arrays for Glymur register regions,
> power domains, and NOCSR resets instead of maintaining duplicate
> Glymur-specific lists.
> 
> Attach each PHY instance's power domains to the device created for that
> PHY. This ensures that the associated GDSCs are managed with the
> lifetime of the individual PHY device rather than the parent multiphy
> platform device.
> 
> Validate the clock-output-names property before using its count for
> allocation, and use a generic module description.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
