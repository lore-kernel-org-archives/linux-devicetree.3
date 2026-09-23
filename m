Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5C647F3C0
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168700; cv=none; b=rQndkMSMXaWyzp+xg+dGIbU2vmTbhkTb2o69QF8kGpfwRBw8qCCTE4ujBG0lVHgzFqcPHla+x7I1I5PujsnRwH6uMHvRdyTF0gJFXRT8ey1jj0OyRAbhC08qmS301v2kX5dHWZJIBqvs5b9OZnBrGBsXabZcZ8uDgvugbeNKdGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168700; c=relaxed/simple;
	bh=NRUGg5BizThFVRqVbbTcHF3tOAyh4FWCybNHMd0g2+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1vGjAWnUaGq7+4dRxXcOqguOAgMs1P5RiZ+SBLQ+eFuoz4h6CarJAqhlLWx7mL1e1dbOontMOs62lvK5NsMYoWGS9qZqifVjRB4MArkVEcN7NVAmyyHEUUT+e05YE2cUdz5YSfBtDnEyv0EcGMOQ/agmw+eru3iWccKS84V8RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROLPTCKx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJo8yTiQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROLPTCKx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJo8yTiQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTGL3295513
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5f+Tif/jg8DaweC4gQB3SQOyd5nkuWXLZR8z1vD5tw=; b=ROLPTCKx41a6gjh8
	S1BoiHZboeqL9em5GH9tfHOQW48yLXWSMlJMRLZUEpLH10XA3V4m3eWHkL+dBt0r
	Ph3ioweelzCiTzQ1ndlPHEnpS8xlwRWhhFPj+QjPGzsnCyhSkFTyxVEckInowNXL
	QHi1ptfCtFv98LVmLNeVxbII12q03lrFVpCcULBO7NCI64KmTJGz9GW5JpMoLc3T
	jbrqtbZ6bdG2Hjeb99eDwBHRK5wm0RGMAzQuarw77/4lG+OwWsw3DqwGNbQR71mZ
	PsvuQMWDw01ZK4EbuKMoos2EXd0Tcg1iYeFBK0vX4H1Gdx8dNksVevRbE0AjK8w7
	xn4/uQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8xab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so8109455ad.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168697; x=1790773497; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5f+Tif/jg8DaweC4gQB3SQOyd5nkuWXLZR8z1vD5tw=;
        b=FJo8yTiQAfVqWR4yDurgRRt7N7z3F6lsJgC8WNkdBLrDAvRrh7Zxe6c+PPizz+n3at
         1Sv1aN36rNcNTNvKBdcMCyk6/bfx6BDf/yQQoBVfQNv+Tlup56sBjft1qJQm0GvSHYHz
         u+sHtJg0P/C/aah3EGEVtqjAeL/V7CSDBa789sutEjTSihYif18ITg83QQsi1KRfrAmY
         Co5Q32SKfVQmYP12a472oZOsRdm/9LqlNbWEKjWZaWnZRAqIvcTtJn6Vgd6jzuvfvzfg
         QUrAM4fDnJ/LsuOl/pC7czu0bNEBEhgc5xL0idl+zzp1ND3MLVkUmvLQ/s5OziW0xn6C
         xdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168697; x=1790773497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D5f+Tif/jg8DaweC4gQB3SQOyd5nkuWXLZR8z1vD5tw=;
        b=w6flpXgUNefg7Are55x3FN9XkIO+lmOLJ43nXv8QzAS7omV/nT3UOGyJFWKjWHntaW
         zE5fMRhPyYIVAi1ql+qr3mxr0gIUCR7xXytYi7GeQZIi7f0XDIp7NnnXl2kEdALPpby5
         wcfNS9DAira9YXfXsxoGVIbkUFTuH/JOTntz0ztwrkSu8X82EWJkGEUnyW6SevhbcHjM
         8YNu6Tl5yb0lsztJ72sqbSAuRnUYrjPPsVON+EBTSuztLKPDPe6eOhxVRw0Kib1ZGK8r
         wJlkCtvE8/ZHvG0MENKgR7T1Q07mp4b5u3IiNf68Nv1hMV5W+RCM1Yxkz15Ai3O6Qp0W
         TGsA==
X-Forwarded-Encrypted: i=1; AKwUvByLTqTO/PSO2taSmmql6G6KFbmSfkMrxSJ0eX5JHBESZMsTcD8uepHpe35uwYtut7Zpkhuhp9fPkiYR@vger.kernel.org
X-Gm-Message-State: AFuF++kygEBzyVz6v0brQ6fggMPZuCVmPBFIqmwKStLrfSACl4rkBnRh
	/RvIsBlK8w/lUoFw09XoFBOgG7uoKZTa0MPWH4zdxYeXjL6GBCTk14QWrBx9xubrViCoP8knwY6
	N6D95trILsOe3pnfqHquzA5KqStIimG/oROCdbCTGQF27QqhvQRRAehE5XVMENrkf
X-Gm-Gg: AYBFou3OvEog5XaxP50A+dbozAj6gF8a5zbEEzDzBM3nS5Hdo76UMmmhAFMo1khFDZ6
	2Oyp0U2TCxUYTPs9TrWhvdMOIQwsaSiVR/oWDFSCiHYGT4cqu8QJZRHZDYzCcKajGoYnDp4K0Jv
	6QAD3n9jxrNtbubzT6ddRd41yYp/XoDHL2ed2PNKQcdJy7pBibDV4lOMaLiArAwkbFP977ONldn
	bom/skcTCr1MyIV6SWwJGlbSvfaPOvWLYKqCe5zYJGmU8aZLbozf/69bsI/qtT+WTbo2UblOHgZ
	CgIe+GlDw64kiemkJf98asIYwq59NrvXTnazu9AUJfIRd8vusYCPvuDOjxHITY+FX6h4zPprs0p
	AIbbTvd0QNIZ7+fQu+RIr2LYQbAjI1yJwwcuX
X-Received: by 2002:a17:902:e946:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2df69d222b2mr23014945ad.13.1790168692327;
        Wed, 23 Sep 2026 06:04:52 -0700 (PDT)
X-Received: by 2002:a17:902:e946:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2df69d222b2mr23014575ad.13.1790168691704;
        Wed, 23 Sep 2026 06:04:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dbc0fsm10216555ad.57.2026.09.23.06.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:04:51 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:34:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: hawi: Add base MTP board
Message-ID: <20260923130446.go47aiotedy5nprb@hu-mojha-hyd.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
 <20260922203905.6098B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922203905.6098B1F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX9fLi5Wcg6gHG
 v5F2Sexz5iKPhYENmAuYsP2Yc9eCZoOFhFtAoVci7BJUQlBBFcjl1EvRSOsLQK/wvLPqXAO8FAa
 CWN2uv6OimtNNH9Wwsg2m88n/noFi6s=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3ce7a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-hpYfT6GizXsa3i9xE8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 1JIxisF-eKReuaVzh_95sXPJzW3K8BYt
X-Proofpoint-ORIG-GUID: 1JIxisF-eKReuaVzh_95sXPJzW3K8BYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX/kCTaWZJx6zo
 yBOvPeLhYN0RBr251fILt034SkBZ5rn0Ls5yZI24c2e5sVP0xGDaquUxyJCtyKAAaFf5griGiZa
 tLhkvCTVt2/S/O0kkKaJxzJUtOmGFM5MEs+J7xC7HEQ7F1LmaAh/lS9xtzcPBkG4PRf1jwdeUqU
 Aq5Mouscq8dQanSm/Ja0C4clptIshajGVEIWPPBNN6rtROgFHrSfeuzsvH7IN2kmnULVd/jmhkx
 VbPxhs+hnev6F0qw5lPgDC6PrCQhValmCy7DBSd/SfX+AmD/iJpYyW6e6p42qx6acFMXP/ZU1NU
 4bI/fN/XgNamCD1f5c68f3cy0WKx+BfTetAnCcC3TjKDRxk5+0D9+v9NtB8DD4vYh4/DZ8rzJNx
 9VGijwNYCvYHN0y97eKtmzzB+CSSrwBPeJKEXvVFSNWST67qKXGlUQu9XeDT4WZiCnX8gRt0yyy
 q3ML1P9B1mZgISecpAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On Tue, Sep 22, 2026 at 08:39:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] dt: empty endpoint with commented-out remote-endpoint in pmic_glink_dp_out
> - [Low] dt: use of deprecated 'gpio' property instead of 'gpios' in fixed regulator
> --
> 
> commit 4899e77f8239c42c43d695808f8c3db4831e0a93
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> arm64: dts: qcom: hawi: Add base MTP board
>     
> This commit adds initial support for the Qualcomm Hawi MTP board. It enables
> several base subsystems including PCIe, SD Card, UFS, USB, remoteproc, and
> the UART console.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> > new file mode 100644
> > index 0000000000000..7709582491f9d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> [ ... ]
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> [ ... ]
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_dp_out: endpoint {
> > +						//remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> > +					};
> > +				};
> 
> [Severity: Low]
> Is this empty endpoint intentional? The remote-endpoint property is commented
> out here in pmic_glink_dp_out, which leaves a dangling endpoint and might
> violate OF graph schema requirements.

I can remove it for now, once display gets enabled, it can be added back.

> 
> > +			};
> > +		};
> > +	};
> > +
> > +	sdcard_vdd_3p0: sdcard-vdd-3p0 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "sdc-vdd123";
> > +		regulator-min-microvolt = <3000000>;
> > +		regulator-max-microvolt = <3000000>;
> > +		regulator-enable-ramp-delay = <1500>;
> > +
> > +		gpio = <&pmh0104_c_e0_gpios 5 GPIO_ACTIVE_HIGH>;
> 
> [Severity: Low]
> Should this use the gpios property instead of gpio? The gpio property is
> deprecated for fixed regulators, and using it might trigger dtbs_check
> schema compliance warnings.

I think, this is fine., no change is needed here.

> 
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&sd_card_eldo_en>;
> > +		pinctrl-names = "default";
> > +
> > +		vin-supply = <&vreg_bob1>;
> > +	};
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
