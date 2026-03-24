Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9534631AF1F
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386549; cv=none; b=JP3jdPSW2u7o4diVWOcC9XJNNiKrRVJ8Gm2W8FF/NHUoc6ap6TNpvmeSWkfVZch29C6gkpouIWQy9qntJf5ZHlUd5rgYI1dKjsoXm8TEs4juVk3RzFBDQh3jI74lIeoQ+O6FGMQw7BSdM3UJTaUJ0TVrZQFlVieGqW2o0KioOhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386549; c=relaxed/simple;
	bh=oio7+2TSpehHP+cy7VaK+z1BN8iuje8iTeHZshwifIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeUYRH/ooZSSIdwyskkGdjBgplELRBZ+nLwDONtb/wu/pc9s9S5ENSjA+2BMpWt8JCGWd/o0g6hiWHm98jUPBRmep+ZF4so3hhABUwp88IRVpc+DnHlhmgma/opVuKZ0sr7LV1gxhhqPvcqQbbmA79DHryZ5ElSoGgKZXUTkTRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSyNag0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvd6BazR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSyNag0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvd6BazR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJOakT1862769
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eo/xLhqTxGStSv2EPTSDhQLs
	jCktVhIs4u9mvMOHYwk=; b=MSyNag0V4AijtRz+rydzkPWOCINL9DbJykc6w3Nn
	QIwlmMePIjqbYRGubStG6C0Di5l2eO8U+0Mm9IE/fr6G6Y6s8KRWzcBCLqKdXMyO
	3vI4WMXqAqlpSsC3eAByoEWMTPqSERjU3irvcKfLBg9wraFdViye8rYPBylnjjsY
	DM7TkOaE+WPLJfRbXSO8kVopkVdf2YTL3k5xqSdxwuePII2sa65YSylBVixqyHYJ
	vIGumc0ULLYSjj6+12ph7mDzoToJFmJ38KYKSa/6tZr1KueRNdd3CMybZF91UzIP
	EekeOVWViPSM+QTZdkuonfcPoNgUVOx8VCaOvcJY5gW5eQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rar95y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:09:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso140594391cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774386547; x=1774991347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo/xLhqTxGStSv2EPTSDhQLsjCktVhIs4u9mvMOHYwk=;
        b=kvd6BazRxUoP/uz2TmQlWyuweU4vdDJDgWd5lAhkSlUubzaLYIEqPyMu8iaPbE2N6e
         xSvanvlk+KqXTHQrjGY/Id2JbNJgehJdqPeadrSE0nyyr1OQFYvref7WxVWziRnRhtHK
         H+XlbpkhSso5cBqNpFBpvCQXHOahB+sWF1CCKPGeaSYHYs6CQutQjZlowtr4YxH6s+Df
         2k3ewz9C4Kudw1j1arghMe2WSRqn75XE0iNopX8d7qBEYb6QYJOyJHsPYX4XCj9FeVXO
         pqkP7fnFHWKMjckkC5ufo9e+F7pMws1OQLjLLbNZfKfgGogrn+u5JGXEOhxV2MZTCSPd
         BjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774386547; x=1774991347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo/xLhqTxGStSv2EPTSDhQLsjCktVhIs4u9mvMOHYwk=;
        b=Nz5cJf9vRLlUv1bm8iwuwB7BqKNMJJi7kYthAVYhYdoBJC7bdinaEBZMFo5vIt1KDU
         u0P9r6v2eARj8M0o0JrJBtJxrB3GtftSbhULqmO6TTbwVFylC1pSi+BZ7q476YOVQ/u2
         JeKBLLHmUJUPceZZNPxVIDb4FBZHo6x67wY75OuH/n9tVVEFldLOOa4PUSSvm/dwwFog
         hweUVw5TOyeCvZQQ7yRZZqvBKM5vTgZyOqn57Dkqilv0JvCLxoSLjG7YLgFp9cYk65Fp
         gt5rVo/1p4LPUokA0kd6BnfH20+YjkceRellHmohwkX+PmVvqs6ZoMoAqb11BXlv6GwD
         5xwA==
X-Forwarded-Encrypted: i=1; AJvYcCVAlU5CW8RVeBLXqaaoyYuwrQqiFgr40jmF+6c3VyOG1AFJPVu+aDQNKPRUJU+12mUjsW4zuymaBjsP@vger.kernel.org
X-Gm-Message-State: AOJu0YzXztkRSqSR9J/vk5IvhUw3sqUcV7Z3JmQRu3SMRZ+Czu/S/pjb
	/RYaLaoxbz8fsMKCaSGIRLljM+TiBW/tM+stx18c3G4Gmbq/N/PQ8TQEPyofAqk6abOdd3kHSbh
	g8a5u554c1ZKKMDcjkXCV2NxRMy2bfdb53W8Z68BEdN9hH4kxLv7pGFXwFsKMeUJH
X-Gm-Gg: ATEYQzzqikRRO3tUAn9/G/jc3TTPRa+0kDGWG/EojfKCwXTn8Fy0ATCYHlhTdxye/Co
	x4Oopj3ru9jz4U1fB+UsVTkjEjJURjBURiOkcWF7qzC5wbFN8hQo+BcBkLRXyOfMhwroB+SvOMl
	zrZ3fgHbrKxoFENwGp7qbKK8e0sqQVvaoTDB5bKqZ5czAuPAT26MXHgljJLGdf5k+8uf3naIJ2R
	bfH5lAWnkDkmkS4C0t8qxIms1Pt1fzaLKEbFX6MW2eXoIZZM/5o4HK9iOJS+ckP48RR9xh/YZgU
	n9F3qD5H4fM/tBVPct3xmhKK7zetKXVpkHF35ZlLQWsTcLUiHCPsDvl+pXtsphgIe+1cekao/zS
	grMFnrSCYBbiuHhWzz5R2m9/C2S02R9aa+b9cwdsCXBsmEVgBGOK4MaNw9XUuUIt22w1wLTGGib
	kO1UPAAQuxnwtw46oNo3EpQMWSloeCAwuShLA=
X-Received: by 2002:ac8:7dce:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50b80e563demr18810141cf.51.1774386546879;
        Tue, 24 Mar 2026 14:09:06 -0700 (PDT)
X-Received: by 2002:ac8:7dce:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50b80e563demr18808641cf.51.1774386545042;
        Tue, 24 Mar 2026 14:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm3166444e87.14.2026.03.24.14.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:09:03 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:09:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Message-ID: <qjqw4jpvgwzi2kd6xsgewow7azyjoxqm77sn62iipbonuffeep@fs5ra765krhv>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
 <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
 <ttka4uevai7tzf4c3r7rgozzpd3hsdhjzf5uyysfzj24ex2o2v@r64z6pvxb6sv>
 <6a3448cf-dd18-4b3d-a8fa-fe282ee779de@ixit.cz>
 <b7gibtoind5srjk6ncybnen3ikdvwnktg4epyzbltg7alipmex@k5zzpbnmzlso>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7gibtoind5srjk6ncybnen3ikdvwnktg4epyzbltg7alipmex@k5zzpbnmzlso>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c2fd73 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=mwY33ePZmbrgUz7sd2cA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: unxtp2ysZjfMs2KNlEU2Cf6pRaXO2-Si
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MyBTYWx0ZWRfXy9RgYGxWOZ5+
 hsU6VAw83NFCGWdasiO/LNrDeiw8rcKZ3n4PJtsROmtYsxRfpeyTVoXGzc4Qy3kss7jQK6Ax376
 ss60uJH79y3VSVaaxEvJjW+FD+3dNtqrEAlPIGnTzNw4tpVCMZEArocpmY4ZV8SAATQ5lkdjOTM
 k6DYJDqjNagwKkdY6FsMzDhRRaHFcC45emVFMQcHQpM6y+ejLwcf7UjLojTlJvq+/jUIZM57ytG
 ET6Sw+LqoYsJrhjW7l1AkODJgL1x4iskYRUUxcPCUvcMIaxpJ4L6BHxx3f3GzhSl3HazO7RYKJH
 mEFcVUD11vbYxrBUTYwkck8LAzgva4uoQiSIZ8+xt6HVOAJPgD39XsJhvISdxHgCZybNsG0yj8i
 USODulSn8qEPwngzkCgQ3XjbiY2dcMPI6Jxjw2W4H3WP+VuPtiwMZHfCIUcvKAEb05wwwrgNDVO
 xPN7LmAVOkzapNNc+HQ==
X-Proofpoint-GUID: unxtp2ysZjfMs2KNlEU2Cf6pRaXO2-Si
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240163

On Tue, Nov 25, 2025 at 04:42:15PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 10:29:23AM +0100, David Heidelberg wrote:
> > On 10/11/2025 21:41, Dmitry Baryshkov wrote:
> > 
> > [...]
> > 
> > > I think this should go to the firmware-N file. SNOC platforms now allow
> > > per-platform firmware description files, so it's possible to describe
> > > quirks for the particular firmware file.
> > 
> > Since the approach to put it into the firmware failed due to early
> > initialization, see
> > https://lore.kernel.org/linux-wireless/20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz/
> 
> Is it required before we load the firmware? If so, it must be clearly
> explained in the commit messages. In the end, if it happens before
> firmware load, there is little you can do. That was the reason why
> qcom,no-msa-ready-indicator was implemented as a DT property.

David, gracious ping. Could you please describe your findings in the
commit messages and repost? Please explain that there is no other
sensible way to provide this information to the driver since this
happens before we load firmware-N.bin / board-M.bin).

-- 
With best wishes
Dmitry
