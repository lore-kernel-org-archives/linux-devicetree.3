Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984EB332EA7
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193036; cv=none; b=olqigDc/JEtxhSrFWp//S33K2Or8abHQmNOF4S8VqlGC0z71Rs+XLU+EbmMbdxTfA+L1TJHrf4yk5pDNjy9oaccPpNw1REfbb2VEj/aXLpt2Q5R40MOh9GNNiyQVEvEOOtnrXlvsKHqilhlSdn7NTFzzR6kvtPl6rdeHeeJCw7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193036; c=relaxed/simple;
	bh=rLNRw4I25c+X8WC5X+U4oM+ufx74HVD7nirBe7xd8kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQP6JvLxK0+FWkz9RlXDtQpgj/9vJfI570IepTYND9f8fC7Fkt36eaKxRIq7yEabCRmIbNAweQFv9MXo/abThSBKhPwhd3bGNBLscKtykkOD4ypNazfu9DxumxDI6fceiFCzpYv2oLfZ8RV47pVn/CFCpIJxCo1W56ej0Xb++PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gurYX/bO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CrulikNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gurYX/bO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CrulikNn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9Lr3J4063015
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw3npkapurD4qQBBDrHh0Dr/elmLiIHyO1Zy0YSMslM=; b=gurYX/bOSkt4L2cq
	pst7nmp3djUSKz6aq4UoxhIKzRN2leeF+zj5U9eDhkq7Ld2/sjV8q0hJVEVPd73+
	g3GwFQFyFZupNwPe2gn937wz8zcb7xgytFHZYo/n9XZvOSujrQ12Ww+v9+QDFdJQ
	1KGZaGeuP9RatR8bWSQYSyYIDIjKUO9bXg6udDL7MgG4iH+uF4ffXDs/ZbqCc6UL
	CEkVNI0tveIZs828IiF6MrxAQ4eLLZb6JlSziBEnhm202YZmuqZ/KK3eV68WjcNf
	WFAW0O3Mv7XM2urXtAJETCwA5hkDS7SfNAgc/NSUjxZKVL3iYBqTnD6JdGitLOsS
	w45E0Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u0n9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:17:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575590529a0so7652760e0c.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779193034; x=1779797834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fw3npkapurD4qQBBDrHh0Dr/elmLiIHyO1Zy0YSMslM=;
        b=CrulikNnJe68/RLunrnrtbnnXx5rkFmjlRHid+jkw9pNbbZ2FKFXJrBzELeZHdePxI
         wY69vjfwLgA/MQGfSIAIC4SUQxczz1EuKPIBbtmV5hZhsAc+9SXhgDeivg4Zw9r/kSD9
         HKfziWlrJObLtWuvB4HCNfbPdMTFuhfzt6ILr+mbJeXs8HrfTE6rRNU4KLeYXtJdBZP6
         FgvKTuBOqJzBe27QUA/Vgmfce9QeYE26JTDyAxVQ2dinn9cdWPIF0uhO2Lj6WFnFYn0+
         G2fqxDBb7PvNlAQUBGlHiUXm+OjP4iIt6NtdJZDaLrn4YBrhtIkbBvGc6dHstic7ky4x
         y95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779193034; x=1779797834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw3npkapurD4qQBBDrHh0Dr/elmLiIHyO1Zy0YSMslM=;
        b=oIss78EGJmDVF8/kHlBJr4qRBDfuSYYeQRArXYKJ+mm0Zokm9m9WuV9J1V8DbvpVv8
         4TrkZ1HnAWGRx8X31pBcsvsFRUyKHS6s/8/XVvQ4phsoMRnofh7omXmt78O/IMUtM+P7
         /gwa+8nKOf8/UpxV5r7GrWaN3DHDjueA4m2Osa4/gqJByEwiFY12miJym4HY2Bde9Jyz
         JODvWDNNlKGYKx8aFYYJIgdqRt0755T5yf8okdlWMKyFgtyEWPPtXYZ+qcd4B07chywu
         /VbTtI2K71s49YqqYJa60yWWJwNnQ4UkpRfmXtScJRd/l7EmOLGLJTN7GwhZ6gYVADff
         m3WA==
X-Forwarded-Encrypted: i=1; AFNElJ87cwX/9a7MYunEJQ1YEDmFcXB6YiMzPMUZnT+H1QOZ4btAp4JeqGRLwkvoFLb+zhmIiylyXIN6VtBi@vger.kernel.org
X-Gm-Message-State: AOJu0YykobzGZ7fIf/sJLMOg7PNlVUzwDuPNlJAxWoN9fXN0FQ3SRQaL
	u0og92qv2XxTq7KA6lLX8WBQVuHzq269bDZUOWNZ0MWoAlUrf8lZlCHHxPrQbbJUxg/+94+sEGD
	XevGWai3Fn1GivTP9v0k03HvcihqPkpok04sXVZhnizCDeK18zRAIyNsCGD7kgDy3
X-Gm-Gg: Acq92OFqP3lyQ75JhqQoboL2hit7W/xguEajXlV/sKPYEHnYdIIdUiaxKSF5mgIX5QA
	vb+yGBLxv72hGH8M/Oq+MA9iXD5b3aC6VpoRPCd5JZcsilKeSdjamtdujiHULY0/oJqFdl6Cn8w
	WGwcWpJrIFbONpQWpggJbjc/O1lGvZ8Z0UgEgdjoLtA6/0DVEs31Vr3aAuicbEmg+gRt2yLJNYa
	ln+Bi4XOjajX68OrlQsT4XwPvghJdH2UfEtTALlPbBhKfwPQXA2rxNon1gHr7W31N29PgWlkug0
	SSPmkOElQhbJRu2fQxO96jXcNvc1xnMlZTZ3udelAAevM3eOlmuEEaAGahbqA/OUguUQGX+9u2o
	lt732wWDg78ldTESXDB/vJPyvwSiTfVJhc+mFOODNcPmKYAVndGtbVl3EtqeY83dQ0yF2y9XD3O
	DqyzU6ic6U5rEgMz3hqhC6b4AkBtmkIS8bc1v5WJGyyN7Pbw==
X-Received: by 2002:a05:6122:e44b:b0:575:e5d7:6f1c with SMTP id 71dfb90a1353d-5760be3bc83mr10537768e0c.1.1779193033792;
        Tue, 19 May 2026 05:17:13 -0700 (PDT)
X-Received: by 2002:a05:6122:e44b:b0:575:e5d7:6f1c with SMTP id 71dfb90a1353d-5760be3bc83mr10537726e0c.1.1779193033351;
        Tue, 19 May 2026 05:17:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11b492sm3978591e87.26.2026.05.19.05.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 05:17:12 -0700 (PDT)
Date: Tue, 19 May 2026 15:17:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: pm7250b: move vdd-vbus-supply to
 connector nodes
Message-ID: <otltkxbprmcb3v5irgyujzs3cquimjbq4m7xxmxql5h6shezzc@yugiix2z3vgr>
References: <20260519-fix-tcpm-vbus-v1-4-14754695282d@oss.qualcomm.com>
 <20260519120108.4844BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519120108.4844BC2BCB3@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c54ca cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Z0QGP-DhakG4yMq76U8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: l0zp0g7OHiifzdCwr-ep27To0rvpBOfj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEyMSBTYWx0ZWRfX5ddeg691HKMi
 WENgL3f7TQ+m7E5FhfM+lqSVkRmcP7lZIp3YvLPs/UaPto727XBDCJ+SDliV2YODCK+LWr75aw/
 1yqZabXVFJH50szd/WbI8CTpuyXesQ/ZgNdQGH4wG3NZJq0ib5MaKrUOvC5+gbJeH/9vrySvXtj
 yKt3HsUT7nZ4L63bEO1IY37zNHK0QVl8c45ZpmE/qQd91/hmopIXvFKNtOXQRRjbHAFBNdlxgn4
 MwY5grOOqytX06nJUEUMcZdeOf1XQZqhrzNIJiPRLY2/mivmoDm+sYSz02uwUSNLuD8jIWYdkJT
 mQZsxi8S+XmpkZV9E3BubCmtBb4baLv7hdDkihCbicaNbpG6BG7ylQId/DXGxcrKHD490wtYws4
 ljkYJVh2C+hjFb9gJywS9mvv5zLFZ6AYCJfayPLy/SWiHyTvubUfl1ARt4/1rIV2SVhfKcYn2GX
 iY4D4KA5h+I5sObrhMw==
X-Proofpoint-ORIG-GUID: l0zp0g7OHiifzdCwr-ep27To0rvpBOfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190121

On Tue, May 19, 2026 at 12:01:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Removing `vdd-vbus-supply` from `pm7250b.dtsi` breaks VBUS functionality for older kernels booting with this updated device tree.
> --
> 
> commit 248f42632176b717a6099ac7dd20eb6355d2d9ed
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: pm7250b: move vdd-vbus-supply to connector nodes
> 
> This commit removes the vdd-vbus-supply property from the pm7250b_typec
> node and instead specifies vbus-supply on the connector node.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > index 0761e6b5fd8d1..43cab07126c5c 100644
> > --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > @@ -86,7 +86,6 @@ pm7250b_typec: typec@1500 {
> >  					  "msg-tx-discarded",
> >  					  "msg-rx-discarded",
> >  					  "fr-swap";
> > -			vdd-vbus-supply = <&pm7250b_vbus>;
> 
> Will removing vdd-vbus-supply cause a regression for older kernels booting
> with this updated device tree?
> 
> Older versions of the qcom_pmic_typec driver do not parse the vbus-supply
> property from the connector child node, and instead call
> devm_regulator_get(dev, "vdd-vbus") on the parent PMIC Type-C node.
> 
> Because NORMAL_GET is used, the regulator core will fall back to returning a
> dummy regulator instead of failing. Will the driver silently enable the
> dummy regulator, preventing the real VBUS from being enabled and breaking
> USB Type-C power on existing boards like the Fairphone 4?
> 
> Should the deprecated vdd-vbus-supply property be retained for a transition
> period to maintain backwards compatibility?

Yes, it should be retained for one cycle, I will update the cover
letter.

> 
> >  			status = "disabled";
> >  		};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com?part=4

-- 
With best wishes
Dmitry
