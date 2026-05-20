Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05BE3D47BD
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271667; cv=none; b=dVaSymkw2hb+vdFAxRN5bq5ZIa3O+ivoH+j63p/x8cgxCAJJFW67y6An9R/xtpsSvFcLe4HMPktnK8+iyZIxaABc3defZy3pKYy/xoS33SPKvEJpOtZyWxg4iadY8oXHjdErc9wct9iqMYt3jAXKrPi84Lylr+cf1d0KHKRvWyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271667; c=relaxed/simple;
	bh=F1CzCtLxJoFHt8P+kMbN8ysS7uTa28Ev2UWktcjoHkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyYjCEK0/5abFuiGSkChHubi9wC4C30/aaWN312eMcx1C1ollXwYedcOsKYT9+zGOyDWl9aEXqdjUDAPzspRnmMOm562swOw2vJdsGj87TnqHQcxGhLLODKx9+zm/rZtYE408p1Sgpu2iesKKmyt7MQDags7P97Tl58eUGpV5dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ueg5n+22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol6RSgvr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ueg5n+22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol6RSgvr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nQKH446597
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nl8sC+8zm9kIr8pRpH5xNL2N
	YcseFu9h8lAGzNpYcIs=; b=Ueg5n+225sJZYlBZJLyY5ONCd9Sh4LVuHRifLyEp
	qXYILQK3xkQmrkiOGp/YrRXLtmJcNsqdBNkVxmU5yJlDm7UamWOAjFQoEU83zPO/
	KzcdPVAfVSwsLzj4wBxEkm97ArNrTepOOmL9kb+TKLspQwiDJycFOLCcP8dnOI5Q
	4p1ArxmOUhDVl01XyCYkjjzUD9BXdN9hGGBZfwAjaOA91kEZd8NyADz0BKaiJttS
	dBABC6+CMXq0J5NO786MpaR6B9wbINbvUzqE98tSpRNG0JeUNJlr+G4vwYZ3RFIZ
	WO0rp0Mzd7doOcXHxIfxGEpTISsgpFEppqbC7Cn0E4ZxOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg2au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:07:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso125499431cf.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271662; x=1779876462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nl8sC+8zm9kIr8pRpH5xNL2NYcseFu9h8lAGzNpYcIs=;
        b=Ol6RSgvruyXEMYSfiXDRLAD45QSg1rYj1bdlGQTLiaFBr1bfkDo7Nwa9PkHmBbIieX
         PGdLfoHfDCndN6azM5SFqbuWl5gZk595+sUl5t/Xtb7PM1D0TzgcMO25ONtTMwtYuSkg
         9Q9nCsN9tHpdJLdnXWmN3b0OsjBhaKagpy9JQH6bZVATS2j/G701FBKzEYlCWT6tjvqQ
         gnWZhGrbpZL0EeScSdSg/KL9MCfR/+tcy8vIJRw2E7GQCk1dkuXiIvGnf7r9WFYZ5g8R
         NHEoKkN0XOW7f1bv9vu2boye7YU3RZg4OcxoQUr4koXTc2y0VvTgsUbn6wmNUPCnOFxC
         yhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271662; x=1779876462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl8sC+8zm9kIr8pRpH5xNL2NYcseFu9h8lAGzNpYcIs=;
        b=mK5ysGqg4AINgF2JEyipISsywZ+Nc+s8sExeA1A6t9KvEPJbGZXsVfCfrzculZ/MHi
         +xKqpNPQlAaB5ZKWsOc2Beq0ZybgNivkmJY/xdB4B6b1sBigk32+Mprt++TIALvHLExm
         he1I5iDoSb6Vmr3izpdk5Vyzp1EbV5r2r1zzfKXZORL9kToE64WBbIyFEfQ82Qwtz459
         3+2J4zaOWveO879Z9v4sb2p9AiUelSuTPHAOjzQYU0mIebaJgcXedIJTFLrv/nrM+HBG
         lHC3sK/L6+4Gul4XP92+c+rf5SdksGGaZMd2A+oFg0s9RJKUaok9xmL/jA+PWZdqVChC
         G8hw==
X-Forwarded-Encrypted: i=1; AFNElJ/f639XEG2iq9WVWcRfe5G7VXu8YIbLmqwQDXTmGI190pnIkx0KqkAOeBACj65vzG1RsxjwCXbG/LnD@vger.kernel.org
X-Gm-Message-State: AOJu0YwUNqaOIsAhBrW32CEIUi3BGoASNN+zMrAoMUFCLAaPUZkEDKBo
	9fzoNwIf6CnV/iTnohe8ZP6UEu6f20aaWRBaWpVbgDVmewJr/qnsDA5iB7eyDDlgZnSGY2TxkJX
	m90orkinMMs/+qA6z0+3sjcGCJyApL6537E3xXj17P8A9cAeidxl+R04n+hvkSgZw
X-Gm-Gg: Acq92OHq/QTeouYqIrMz/DapDpqsVdmnjiqeykd3t+ZgSctniCpLrgBVWhOJHIYvPgm
	LjK06BTtcBzg9jtMna6TcFGI/rW6k6+NlK4n7jjF6XDh0LVt6A0P9T9u23tDfBf3BKvFfpVWAbt
	MxUosMUlkGsirKLZEX8QCHsCEia1aSgIgj3bnk7wCHc9fB1C+qUNMIyRc4G0F/I3zObdP3hMs3S
	RBVVQULALkxu2DPWLI9ijRpppZwUPZI/yElpZQireOQPCZxT1mAVjQzDsjsNJ6yO2sLU5eH5smH
	h9jgLjmWezs6XZsDCbDfxX5Bwc2jCYDs4wVJL1HUw6/SWhsgVasGQA+yWP6P9l2mDzMrpCVXpo5
	KvtTmgloJTvRzMTzKdyMG0ZTVG6cHrTo8ihyOjatCqqaFu0KD2nEDYrS0eE74yLoiKPN+j2mhiq
	BYQtWCdP4VaiIAKfrsF2UkPfuEbJO4YxM68kQXDFbVnhmlBg==
X-Received: by 2002:ac8:7e85:0:b0:516:4059:f035 with SMTP id d75a77b69052e-516418b93eamr343913731cf.29.1779271662480;
        Wed, 20 May 2026 03:07:42 -0700 (PDT)
X-Received: by 2002:ac8:7e85:0:b0:516:4059:f035 with SMTP id d75a77b69052e-516418b93eamr343913481cf.29.1779271662034;
        Wed, 20 May 2026 03:07:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c531sm4787220e87.4.2026.05.20.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:07:40 -0700 (PDT)
Date: Wed, 20 May 2026 13:07:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
Message-ID: <pchmvk4khwre5ib2qdjoq3wwxma55rxecuwuitfuchuu2undpl@lalm5eadakft>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: E40xJ-oIJTlmd-Zj86c9day4xhtQ262f
X-Proofpoint-ORIG-GUID: E40xJ-oIJTlmd-Zj86c9day4xhtQ262f
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d87ef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Hbrjtlq9a-Fw36vF3dEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfXxA5ii+1Sb/hF
 pJdMfofo3TlHTFUBBL63NLjFkxMKRTtY/cuCVQO50vsEXZU+Nf6xNrSGNNTlwsqtcLR8xRiRh9Z
 h8jS5Xsc2c8j60h59iC7nYoplybStgmaB2KiTGkspqueslUBYcI1HBk2lExCsMQU+rmGnhbztXI
 NH0BICb0PipByjRKF4e8bmpJl5PuvHNinv+cK+ibXJlkZaqSofqHdCJO5f+A4C5jbOkfmn2v9jC
 YyetsDowrGwxsH+4ah0VnvUhtBCVmmNyeo+ySFvelFnZmIt/VngD6yZCYw3d2Nsn4UCh54/4m1y
 UKZDeyjjPxd64rRcYwMc+5rmvHQ7l8tAy1YX/7h3X5Kb63q5lI9tjzpIG7BICqP6olJQf7GdjNT
 lDS24DlIg0Ikds26M5ZpAEGFDAN5IRCOuIN2XEFhgziAN3oqFcOtmV2qGzrImGtCyEeJjd/T9wK
 bvWPopQv1RAbnhbEh/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097

On Wed, May 20, 2026 at 03:07:34PM +0530, Akash Kumar wrote:
> Add "cypress,cypd6129" to the UCSI CCG driver match table so the driver
> can bind to CCG6-based platforms using this controller.
> 
> This is required for monza SOM USB-C support.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 199799b319c2..0695ce348135 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1520,6 +1520,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>  
>  static const struct of_device_id ucsi_ccg_of_match_table[] = {
>  		{ .compatible = "cypress,cypd4226", },
> +		{ .compatible = "cypress,cypd6129", },

As you are using cypress,cypd4226 as a fallback compat, driver changes
are unnecessary.

>  		{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
