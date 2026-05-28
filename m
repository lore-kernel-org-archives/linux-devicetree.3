Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF228000F
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976112; cv=none; b=pz6nQmLs7wkcW4HBsxIPRVPkqEqtfkiiwjpNUt0uimp7Y41J5NpRjefAskJKJhoCCvSYh6vLSdcgcVxL2yxQElzjRD3tYGYhNRWIrqv3TZdTOEF4xaHPokb5WbuYtCbFWlJlTehP8Q1Osqem2upu1xwk5wGvjcLwHDAxPnDdKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976112; c=relaxed/simple;
	bh=1mrQeSDY7M52xMizn3zLiOiZIdVP73XWHHsBy6AGIWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nn84+mroLCD5VtNFa30w0uIsIAJkRUdcFc+4N6O2NXD8fBG1bxk5uH/ym/CxKFkW1HUpnXxUxeGGauUtm9dNam42UbXVHzqIVrSOhg9mzZRwYw+JUygbxlyjfBCVJMKkYl6Wimw9kO+mtCuAgwkMBZP4WgHOZnoiJgD0Bwd9LKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQxNZqnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5T9FZ5n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQxNZqnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5T9FZ5n"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUhu3203255
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6JbapJaoSx0s4QBRzJFchDoSiCIzMDHmw52CsCUV+A=; b=gQxNZqnK7BaTQudT
	WSTiuRAz1aS08ICsz/5kcvm6HVWBoh8lHaf9WKokpxhZGVOjQxi4FCQWdgLCOt7g
	1XlntH49YpsN4kgd9fZzknsBYBgK/8cqzHEoPqlGhfdiEEfgCmUHmWJ/Q98m++l0
	XVPAIQn+Uhgdvj3scTevfwr0qgcw0PP3wvN2LILAqH2JuXQ/iW7/CyRevy3xpSa4
	5LEXEn+UWQYs6QyzHDGZXMmiTllE3Z4HrNoA76rsjOjO/HnSwa87O/vldWdzDgKO
	hKNVkE7/rRJ15SjCP8HkuFXvlOITxgqfdv0f9psx1ulFNHOOKFx6WPLqk7yJuzHk
	OQqAbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjy5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:48:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3403e99so88384931cf.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779976108; x=1780580908; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6JbapJaoSx0s4QBRzJFchDoSiCIzMDHmw52CsCUV+A=;
        b=F5T9FZ5nr9aZLAAa5DWoyrrCoME3Nii0Mj5CiCAw5fcIRN6e/plS1YR59IpEhYQjFa
         AuiN42MvgF98+fJujBYIBjjgd7nnyASqYYlshrCYp7txcUsEyIto745b9SGz5tUNt4FK
         WN11Zzy2pKEVymjGHigyUSrNpHo9cNLMyZ6VeOgJF1oX9kG62KD8PN1h3KfLVTeC0tHC
         E69wzEJ/hmOwtplhv4yZuj9xIXJxKskF+QAW/2CjZ3CDiy0hrVfSd6S7RJLF2Un2wMsV
         DeRu/ZoBQJhQtOztZhhDDB0H9DkO/F/L9IdebdDooIxjJXFYHsXia06Sz5TTDZ6sqIS8
         pQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976108; x=1780580908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6JbapJaoSx0s4QBRzJFchDoSiCIzMDHmw52CsCUV+A=;
        b=f9JqWLJvEkHjN9rWSGJplXV35efIwH2lDdmN+I8gl/2CAhSDN3NPbtwpOVLHKO/MYY
         vGyruXrYamsq54Rl0NNRAWTBl6Qe9qi5A8nTTaVsM4iLBKJ+9gOkgYIemPby8sijOy6J
         yf9XUzzXEyc4FUcXIcaz8ggEEPvx4uq5u4r0FrHuivd0rxmmKibXEaM8YSst2YGQeIXA
         nw0l28RVgPWt1JvlU5b/qSD8pFVoUyX0daaE+MhN186mb8TgBEtJ6fvIdLd/6QVnoJtc
         lB0jWwHyyyrB8XdGU0mlI5VjFxfRnRwvPjOUP0HldIReVUlWb1hAyHxNWlf4ELDbIY+p
         FdhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/szV2WY2LP8Va4HuCF4JDMfu+xAmISZzlm6hj9EtHR+Z+V7WvMZntvs6lucb8JJoF7bi5pjcw5czcU@vger.kernel.org
X-Gm-Message-State: AOJu0YxbuhHUBsnNal8aRodP1o9/0zNBAEXzOMyfKpYIzDaDIGMEG4BT
	jNB3+map1670tENxPEKYpaUt+v4leset5i91yU9reslhxccO/u3vpjQPJDFcFN3hPBSMbjDpFgt
	eFO5OxEqZzztCwgiYGnnEgSHOjuDCUPxvvwfzPa0K8Ogo4DeWmrmF3S7MmD5VEGXn
X-Gm-Gg: Acq92OFeP/uViV/h7RO8auxcPBfyto4B96QvdbUJS4v3XzJSuxnY9tk4x1fSaW4CFcg
	VtLmA41ervh0OAeWAnL/lW+HYDbswTh6V9PWZt6fCEfA5TIl2UmoTo+l4ncqrzAIgp0DES6kpWM
	MBlcElLD7ciJmekpsMSaRqbDznNkuNmX4fLsP2oD1iEM1WYRpat3j+pjAIx2kaFHlM0IZE/0/dS
	EhVH+LjsRl3X3e8XXV9D7XxEJxgNtwAxhLDYDADHKg9w6u2AkuE7aIC99LgyLsHYH/iXnf+ikY6
	jKKyX0TgBEqokC0dWl9s8b2h0VsmRo5jyUi7EctacFRZfEXoRFt7zUAqnxypP1F+/S/h4Xc96aL
	a9xhuKDDUK9dNpUayB0jlyt1SUsipCFB96rn9u+PaFtBXZG5qHpbwZfAEEudH6bwtG5AhVRHkj3
	R15kl5yyNNOsTtaeIseDbyMa0AKHjJa9KMuz3O2yUvPqz0yg==
X-Received: by 2002:a05:622a:134f:b0:50f:ad91:8912 with SMTP id d75a77b69052e-516d445981cmr388784231cf.13.1779976107826;
        Thu, 28 May 2026 06:48:27 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:50f:ad91:8912 with SMTP id d75a77b69052e-516d445981cmr388783831cf.13.1779976107344;
        Thu, 28 May 2026 06:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa463220b5sm1920287e87.52.2026.05.28.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:48:26 -0700 (PDT)
Date: Thu, 28 May 2026 16:48:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfXy/ncSq5cLP71
 zDqBFaeLYFzare11dHpq2bu7VYIzm8pWxXDCN7M7aVzXyuJzxC7Bqz7RblN5za7sQw+oiHcwzb+
 GfhHA9iW0SfsJur65b733dl91QKQ8p7uBlzN8EOcYvZDQY3mh3GdChDIUXyTjPrDjke8xZ6m5TZ
 aruWCJAte8pOr6AZdX/9nam4Vhlq/9kvc+RksS2GM+az5+STah93aAwVaIo48tKg+llW1WNyHdm
 d/ertxVTgE9986H5tk17gSMxMkz6d/jtGHLjl+jATBDC7xZdUpDwyda1M5CMA6flCDTo8HGXVZe
 eNHK7/dWDRdcrXHXS81XtPty6+3jBMOZZNtjXhsbTc3Zu4XwkVOL6u0JNdulGi3eopwVQuH5OZH
 6y5pPoRxEto430wQaDefwEqUAaEICJ/TJTKAXQoBJ55AqokxqV7LlAW3WAkGMmLgMZ+roeqFXZ4
 xZHiWVGDwt0MddVD9zQ==
X-Proofpoint-ORIG-GUID: k9kwMw9Yjw3rGx8DuZISyP8a03eAD-zT
X-Proofpoint-GUID: k9kwMw9Yjw3rGx8DuZISyP8a03eAD-zT
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1847ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=HkNMFyVr_tcJnp_woqUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138

On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> > > Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> > > under a single DT node, each requiring its own pipe clock registration and
> > > DT resource mapping. The current helpers are tightly coupled to a single
> > > qmp_pcie instance, which prevents reuse across sub-PHY instances.
> > > 
> > > Refactor __phy_pipe_clk_register() as a generic helper and reduce
> > > phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> > > qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> > > mapping and pipe-clock setup that will be shared between sub-PHY instances,
> > > with pipe clock names parameterised per instance.
> > > 
> > > This is a preparatory step before adding multi-PHY support. No functional
> > > change for existing platforms.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> > >  1 file changed, 44 insertions(+), 32 deletions(-)
> > 
> > I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> > end up having too many single-platform, single-device specifics which
> > don't apply to other platforms.
> > 
> 
> I don't think that's really needed. This shared PHY concept is going to be
> applicable to upcoming SoCs as well. And moreover, the split won't be clean
> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> driver and may only end up keeping very minimal code in
> 'phy-qcom-qmp-pcie-glymur'.

Then splitting makes even more sense. Let's not clutter the existing
driver with too many conditions and options.

> 
> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> move the SoC specific 'cfg' structs into a separate file as that's what
> occupying majority of the space.

No, it's really the 'shared' part.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
