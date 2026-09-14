Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985C477999
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394604; cv=none; b=keVGgug/9m/MXpIwVPrtKeczzcloYfDqdSs3VBGRgC2j1Ib1nZDC5WwsTT6JpB7x0+5praDQjwYl9semaLAPB7i4bEoBDJElyHCD7jmdMyU9TvTokFJPEVDuAasZSPIllCLmljlWOp8CWYbhunNpww2Oiahm5Mn11e5XvqxVXFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394604; c=relaxed/simple;
	bh=veFrKTAc8vROn8LflcgK9hdghqncqe4wOIseyA6YVQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbMdJIa2kurgtalsXv4ta6A1vWC2wDsCF72fuNm7P/enAL1MsIuJm63ThnzDU11Hvyu4cubhtrkWGcwTRlvDPLP40+8X/AgdLGy4efFn0wEDL65xy1KPoUiB/y45DItvR6vYQftTQ2THsliDeDAgIDz+qovSTupyf9yRCrkTrx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBhRUMTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhUWITkj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBhRUMTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhUWITkj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0T1r1761392
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJLwYSimBgZLHlMCLJs49ctc
	RaD6WjoWxoa1Bx4XulI=; b=YBhRUMTc1WezRos+cEr+2rhnWlYmqXw4Hy9YQP2R
	vaQiwLYmZUZ8Suz0/7BUDm28BYVZD4LtpMKwKYu0jF7ItWIo/5SSG0/LMCErm2oz
	Z7JhAYel1S8oqrf8uKWyIoPqgkNEoeZc/qDpcJGcWgP2OVlqkZVogaybUlB4CP4U
	lMtgTeLyBOoFxOt4V2T5F99G6i+F7XrteMdBre6o66LI3/QILsi79xxDvmZjVA7k
	o5NKQDPG0CVxpb35H7fdzqjKOMF9T9+zJjjzlWo8Am4TWi/SB0rdgwSEuhMa/jxG
	V4d/8e8dU6tv2JZzQHzpF92Fb9aRwr5QOglGBS/fdOpbgQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex90r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:03:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c96449cc2aso2833092e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394599; x=1789999399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJLwYSimBgZLHlMCLJs49ctcRaD6WjoWxoa1Bx4XulI=;
        b=RhUWITkjepDy7F0zNbTJ68RWFLPvMjOU0SKhepbkLfFEchFcgPl5Y6keS3nw5jTAmw
         HYOaCfhmxdyvNtkFFMQEE1of9q8d6ZFMEH04vviTo4LyLzTYi5cmKmQlNvPV/lXEvw3O
         uGCaFILJt3KjjfDVEQ0SiyeAU2ziAn+8L4GXZRygjtP44L74MzjOj+c8L3s+zf1SxO5o
         xy6dkZnTf4uixVZgbdLQXwM73Xt6xP8F0WloMPZpiGTwCfu4zZXSTV5TowFjO7IryYoS
         DvcCo6OS4R7avksrVoKaBdPcQbBKfAqGcq/9eid7JrJ0i8MudKzEbKUpkfg+52cY0Sv1
         Te9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394599; x=1789999399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJLwYSimBgZLHlMCLJs49ctcRaD6WjoWxoa1Bx4XulI=;
        b=KLTYpAJZ/p8hTcDbt3xac+uiDEqbsF1fcyI5kaDn8dE1hFFLhdMbm0Uhctf68ZpbiL
         9/eXigLL7ubZ607/iPO78INP1lTrbpgeyOEEeWUgJsc82F6dmEhD5KW452k0huk+S2kZ
         NmJB0JG0cn2eZ1UIMwAjmnWiu/gznl6WSqWH6VYe+R7R5W9Y/o3mXf7RKsKXFHMCXNhJ
         Lau+AiGw56Z5M6E7F4EDYgbfsVYABUvF2eX3CLf/5Q970xBh1JXDcROcOH1174azmd/t
         RZjwq0E9flg1on197U/Rh0nwcTLncJNirlWmH1opWgjp2M3feG9++39Xpk4rZvqdO8IJ
         G5LA==
X-Forwarded-Encrypted: i=1; AKwUvBwz2NH9OfrWGTN1imUP9IKj1P0cLx124pxbQOblqIt062cd1e/sjJX6D8v4eFQcXv28lnBxCQUOnhLi@vger.kernel.org
X-Gm-Message-State: AFuF++kk0cdtqWLYxiaOxm75OIltnA444v0o3RVefEn8HV0wTgGpEOSa
	LcYrWDZjPBLcBVUWsnHJRVF0E1mwWd9BjxB5YzUp+JopifKLcs340pd3xVfWsdP4Mjfk9RP0OMt
	pBl01C8nHxM5sgri0CYjEmk6xxvR3pKmrTwcCOQ5ioPi55fQJ4eHuoi2zDFR/Lxgr
X-Gm-Gg: AYBFou0T5Y7wFCk5betrb5Wtx24obzorFg1slfto/z9qmkfGwPUegwxsxmM8h4lO3mF
	gmakKYUUAeK87AxL03SHFkCDCv6KW9zPvoS3evTnO2SgXrcygbmPPRT+jb+zO0J5pl2p2LI4niD
	Lc5CaJOoVGiGmn8UJQMb7HXMO6RYLolF+bNE9iVNuMCVxHreUhRru1ah0jQnqIEpBx4HPFwJ2gK
	Pg+ldz1POl0fKgpPd8GUi1xEcSZIdoKU4QyOorAmv/PB3LmDnSNR41NxtiUrLUdVJZOukr0OKpi
	/iGIqrZJMQBQc2ebkaw8YrqH1IVVSlYDxjFKJHqxkTwNRQUqdPa/iJU4SRVB9Pt/3yfc/61zY7w
	o02MVg/FKONIfvdA=
X-Received: by 2002:a05:6122:1055:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c974bbfa09mr1905466e0c.7.1789394598671;
        Mon, 14 Sep 2026 07:03:18 -0700 (PDT)
X-Received: by 2002:a05:6122:1055:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c974bbfa09mr1904778e0c.7.1789394593473;
        Mon, 14 Sep 2026 07:03:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm25999064f8f.34.2026.09.14.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:03:12 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:03:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <bhwywy2ldrpwff4wxi3slisbggqt74pqz523ksanusssmpfvbn@ht7pp3fafw6p>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfX85iouurFckAi
 Kq9fujOs6iX+MH9mp/9bQojgRw/WPRH7AMUmuGDxshZjW/o1fiuQcxhggeQqdbbBQ2ItgVwZO6E
 QXBW5s8MqF+tqfqaB412K8jOud3sR9Nexzjm2Dw5biBda8tAJpYHwEno54loF6vr4KduGw1l002
 JsrwcwvMzHlqtZe2wnqVM1VdKREgpeIK3EXFYrNoLk1UIZfLshf5cwF8L9bSunxp57mx/ffac7u
 4dQuSq0DQ7jySG+5paAk7WvC6xkoTd9BI0KU3GD8TIjVlB4MfQlw+yyOSG0U2+IP6Ph74+Jw5BG
 ZBNQnqTrcLLplpxQSZgkUrf9mRu4MYFedohvHXuZJiJAa0Kq0fJW8bZ+r8E3R/qQrGZ8ALDfaf4
 sHrzP9GLbiOglGDcr5e6Zc+GBxn8mA==
X-Proofpoint-GUID: lAchSyluB6L6osWaeTWQeUxIWwCy8clT
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7fea8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=l9x3Jx16obnCIVmqrg4A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfXxlN/N7fRbX/X
 HcEMGMek1djmhoIeLgwrTDHw+YOs9i6lOvLfhBjOQDH1ue9WdzlzUkTeyirawnAYnPxpA52EX7G
 rINjxkauLl0WSKHK5I3rLQeod9HY4X4=
X-Proofpoint-ORIG-GUID: lAchSyluB6L6osWaeTWQeUxIWwCy8clT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140200

On 26-09-11 22:17:09, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
