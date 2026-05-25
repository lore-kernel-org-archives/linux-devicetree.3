Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F6B3AB28F
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698748; cv=none; b=MY9+sLkarJL4gzMAwQtx3Xmb8JAg8eD90gZcMDbSb9X2DHHyeDwYs15/zyBJdkzwpd+yETqmDFkq/zi5bJ/1d28AWAhVcnHv5mG8+E2Y6xJz8tLWpACRYw/hlqx+vThOBvMIbxqmukQkxiCBP13uEHZvz0rd1UBoAfkPbP0sB4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698748; c=relaxed/simple;
	bh=eqUB+beeVwmV54p8GMWozUcJ8djAAGWZjc7y3WMmUk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5qCQ9jAJ1e2qDQFGg59PDL4UoBpCfJ6eBFprBEMRfu8lD8ISYVUsk8Hpzjryv7mNV7djdLArkoCPriyIIDcVF7yt34a8WIOwVE3V0PfdGNLqkVVVwOBzlf3IMVQfBUEbYFALdnq4790oioBUwZGFvRPmqoDUwuXPJ+1reKEXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXvmyWvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Era4YHSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXvmyWvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Era4YHSP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6ruxs1372418
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PUMbg6cDpe8XLBpHj57dSo1q
	TWRy4Xqw6/CpTC9UXPE=; b=UXvmyWvmt81bxpC3mmtVfd/pAqTjpQeDifowuZTP
	qDx/S+XeFBPKVw97IU3D05wQCd/TlnpWUiB3yDxdbJjhO6QVD2QAVdzuEdpA1hZy
	LV1NICTC/qKZMkejOx7C/pveMXc0qyrkGMuuOpfF8CpNDPGllPnQTeLuUq543Ur0
	LrOMQlV71aycQWRVtfwSEAxogQfEdkkIa9Dpqonc8o22qYtnedfcSm9glZ2HasN0
	qsDG8Te4h8W5iRDZVfEtzRCxoaUqcEQCJFe/J5J9XDlvQnYDTxvN4OzHFnLRuSkX
	ntnT0gcXbyUrxX1onwDaYkkws6XHESfocjA67/h+3usInQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmp7r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:45:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d191f2ccso72422231cf.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698746; x=1780303546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUMbg6cDpe8XLBpHj57dSo1qTWRy4Xqw6/CpTC9UXPE=;
        b=Era4YHSPpVRmT7+wwgqi3bGY+GZs+42P0W7HudoALijg8IQF9tE2X7TlYe4lNRy9Vn
         P+OshjhM7d77aLuJNAL6bPlLwTV2xg4mAbSEBzf+ppekYBHcK/Qusptq9b4TjlnCC7yn
         nKI7Ft5iCrnMl3hNUVEpXOEbcw9rM72hRxAJheRO6RrMboZMIkkohS90PVVDMDyzAsWE
         lP1A9NS1edT1KZY0W2yqry9UiUUXWP1QAlAf1VBuV1ePBVygqPDgWtTc3C6kKPQ/8D4b
         Hhgj81Fp+UaNH1Kq9AdOl8QXv6BFZmYe9qUATLIwYEo7R6lZGKxfWa5DTB8Ur2Ki5M8K
         SVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698746; x=1780303546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUMbg6cDpe8XLBpHj57dSo1qTWRy4Xqw6/CpTC9UXPE=;
        b=Oh5Tnx/X4lNKVBPf5EdKRwFoYrcbKXVeyZnKgN4TatRwS3yUPP/d0bTV0U7sNRK2AS
         WBn+ww1KjJdOG/RK49SAjrCSTW6SmgCO6MZ18gZF6SGNklhjbo6S5TuqNpkaEM+5Lbhn
         KN+DlCv3OF2pl0qkKb2QAx/TVXmL0Qb/c5e4ahbcf+eIGaczwotOBI4NaCVJ/K01sm7j
         Bh7NchgqbAT1Uq1XbbQdlAYepLTxi2NxAb+sQMWN8tTIKmGwczMOouuf/pegdeADjplb
         q2l3x63S5IBGzBDwmKnekodho8JLFrQjGSg9Pzv4L37ktBznE8kmUEt82cD5i6PLZXHX
         NA8g==
X-Forwarded-Encrypted: i=1; AFNElJ9AFUCMNtkEgWG7XlY5xpL43HJUt7YGzuBo8Q9mmboJ4VgEA/HKKhC/sNwlN0HAxVO4KmmdogcYRnFJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXaVn2J8iIIepLWQhaizeBmttjURhkMfHtgad5WY+h9dHJArr
	jpaGjV/ssqOUwhZxvaDuYt2BQChJHGag+oho8Qn2UC9MyKjzbrZ6DHrOqdpEJvi2HHDe4EQdVLe
	nbGkop9sAcEhhuLX6Xqk7buldekZM2Zs9zTCoKQNiQ66S8zl9xwrmA0E7LCKT+EjO
X-Gm-Gg: Acq92OHjfDc68/bNzZJihAjfFZQr4TyZQPuxaRvxGLOvvuhAQUAEQ0F2doAWcIyDVPp
	DKbV3ssdd/IhzukbMOpalV88vKjvfQ8leXv4bDjfX2Cez/tUguqJOQbTcZTj8ueXMcfw2V91FAd
	A77JFm4FjrbYWDdgvVgxJBL2TcSPQKxmiPP4eJx0alw7LMffWZT3CXtCRROkzhLiNV+latn7viB
	zC5Swp0Driu8EqndbWZdBspeU2JNlmduL+jAoovtWpM0M1ch6Fak/eMrpOyIgIJtu01CNHC8Old
	ClFq0ERYRpIIQDnEQvX7ZHn+vBT/rmg20rCB0BmhUR8ZzjfsZpu2hzCIIpZGE05BOy43O0hA9nr
	z2KHDQ45S0w9/Nv6NKyB1yI/QRbNJaZj9MiAjOe95Etz9JukSEtJykGBkzoN/nA9oveYWBch9Cq
	/nKHopPebYHXRJmgERUHTySHH6I59HK21FAZA=
X-Received: by 2002:ac8:5889:0:b0:516:d60f:6438 with SMTP id d75a77b69052e-516d60f72demr185991131cf.0.1779698745956;
        Mon, 25 May 2026 01:45:45 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:516:d60f:6438 with SMTP id d75a77b69052e-516d60f72demr185990851cf.0.1779698745535;
        Mon, 25 May 2026 01:45:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc43aabsm21943531fa.37.2026.05.25.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:45:43 -0700 (PDT)
Date: Mon, 25 May 2026 11:45:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V2 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Message-ID: <szzkygcwnrx2p54hbulzd3edhwzueaulhpyl35b762yo4enepu@zgzv6oxdocha>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-4-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522172716.820490-4-palash.kambar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4OCBTYWx0ZWRfX1V9iQlizRM2H
 RjbwYUEc4/vGV4DHhsZvbWMfU8k7O6xEvmhZvIvAa9YvkXSxMHsM5d1uC/JavrZHwiU/n00CbLh
 QCWwZa8nIYjFLXK7mSqeTP7ahdUPbRCWs4Wh/mEXD/KmK27Zddq46QIFfP5AIY++222vR639OmX
 Awp4xiM6U2q0y5cLPw1MDMoi5QytDQKQIFxlZMet/aRLUenyDW2LaJ4BHG82jyyLuq+0cu7Fyma
 9l6ZV20K8aaCGLQtVWhKwa1T04SRANDs+K/Hi8Fy8rUSZe5O3RCeEvkFPiAPx8/vaNZWGYE3EdZ
 3UGI/emaWnGmZ6nXWTlobV/fBhB+wvutczYukJUjNUYFlvOmydQZFj95Bb6z/oa4BYOqdqBT6+f
 wJ5bsPFbUvArmd/Sd6zX58yNC+/dyvWK5GFSAnMRv7NfUwcZzPowqBrA4qgZjrCyQFXN/KmZ54I
 Ns0Jx66d1RDOnxEHbPA==
X-Proofpoint-ORIG-GUID: MT-Vxcgv9lqIsVTpPt_TiYY_bWEoTgpY
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a140c3a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=9mNwicV8TSN3JMHTN9sA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MT-Vxcgv9lqIsVTpPt_TiYY_bWEoTgpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250088

On Fri, May 22, 2026 at 10:57:16PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Add the init sequence tables and config for the UFS QMP phy found in
> the Hawi SoC.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> 
> @@ -1306,6 +1315,12 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
>  	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>  };
>  
> +static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 324000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 27000 },
> +

Stray empty line

> +};
> +
>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>  	.serdes		= 0,
>  	.pcs		= 0xc00,

-- 
With best wishes
Dmitry
