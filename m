Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEB5471249
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795655; cv=none; b=KB44N4HpBSseY9InjpaNDOVC72N81+vDR/+K4lFbOaDi1Q63OWocC/mKfjs6fhuc8u43YdkZ5VDpb2u972jZ66y/U5sEgIUTQ93JF80mK0aNIOgt9/BJZCwKCOvcZMb9/8e7YzyU2T1ifhlkXPxYeVzinjAdqJNqc1jbr91JbXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795655; c=relaxed/simple;
	bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tW5hPLKO4yod4mCF3iGOvaxS9Eak4ZQ/ScCG9E7dYXo95A5oY/JP2UOvH+lsGR+1QUqvegyw4DrfTi8UBn5LpxvZu+nB2zuN2MxgodRaY8dLXl1OKO75upLfgSExzCFQR+3l3NJ5Fz00qVksUWDgA8fzTw62oONlmf8duPYufgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChNDmxN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5ax/Spp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChNDmxN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5ax/Spp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Kcmn2873992
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=; b=ChNDmxN/poNfNEJD
	ncPvnzQlPVkG+T8Gn0BwBHidO8EHW40n0TkNWBujAkYIuHsJbYQS6WojfODJnj27
	iY3ugcHRVeD3muaoqjvQT4ZUbt/SPUTwGgkjh++cAnC1jfHLW2fGqZw+5Y0fW3Jk
	Yw7wOttSPZjYyUoSpcC55Y24RNY/prLI/zCbW65I1sX6uOYsrlP/cbg98xQZzRit
	nKNeiIdDIqUR4+7WTrS5YXBZWeP9xYPRYlZlUdUeONFfDNU7/ddy+zeOkQnZiGYQ
	9rM6/cwmdmGM1TBR4dBefDC5XHDJ158BhKc4Jap0kxNfpb6UN63X0o7SyDCee0RY
	YuStqg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe37a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:00:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso3918427eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791795652; x=1792400452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
        b=Z5ax/Spp6k7Fe3d31Og4cFGHsYFbseavSLtDXDpOdtixPSo2XjrysqWR8PTte77hY0
         1sbPcBo4jHu0VrBvogOPNkYDyj6wBWWyoBPxW/agLb4/kEO7d7hirrZ1jeo9C7bzMbvk
         iVFXJAbpAFqCPOW7JQnmnYXWJgjry7ir/1GNVc4z2OlIR/Z12mIU/pMtY9yl51sgvTHK
         4zS6lGJUYvjpTU2OxHjsVPg2bMHgoW31fMnh6C/mvaKehyt4jMC1FwRmbsFAz9AOuYpB
         eGXfJvrKlJMBC8tdrVqsmqHUkmG2shjVuX6YXB2PpjZ06rQKgmSAqtTNVquWalpGa02s
         nCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795652; x=1792400452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
        b=qmhZuF6HZ5NGuw0N8wqsCUMAo5y9bEOhwXIkjjqmqnmkm/5ERM2Abn0iXeTw9cEXt2
         2pXiQL1m51yxsdrb1ZySmpbXNGDSWfs2isaU5WA3NAkBz5gM5vfyPVKcNA09iRXoKPU+
         ibQl4Vsbdd6QxZn54pVE7HvGaTLoPvTeo7PlQfBliAtb5vYsEfEmRgF5a99mRBkfo/GZ
         0YXXs8Q5sZViGYSIatW7+UvA9tttmkp1JldufM5mdTtbGaUFReuQNsoFWLOy7rFVzEfA
         eQMVUr317yd2sw+MCtdysS6zitMJiCIYGous8C608jyCryE7+VlvzTA1k9IFioj8snlQ
         dXPw==
X-Forwarded-Encrypted: i=1; AKwUvBxGldmx5KvaKd0SXhSGVEzxonHcoP8HCEHVlBGsHH7KDD+8OmnRkjKM8wMpotfgK6lIZW9Ir0uPe68J@vger.kernel.org
X-Gm-Message-State: AFq9FYJbkijc8wbirCLVNdzi9XnnXA5jVvTXDnTm4icj1GR7XZc5dvuK
	ReS9Ozs6b8sBaB6APSqRQqf2c8tlo3d7NxmQi/zcuGKaZ2s+SqFf884NzM2DEkVy2kRoNAvhdOv
	Z9n+UdAWKVBp8kA28yRU8bTqMkaZlYMqQl5Izw4LZlJqb9sj0FRzCD9OL75Gi/l2L
X-Gm-Gg: AYBFou1I8twDD7v3jh1vqct+0CZEaonIpDaX8AfgnygOpkJtv+uiItN3hlIqlUD8EQh
	TLCFmcyYRKS/PBDxVtblMeLjMsfzmLtCJZxR/SnmY2t0TaG7OUqqPPBgGiCgUW505L0Grz52+Y5
	rMtvnMS2Lfnh31vJ6Mgjt8ffUhbfFANFTPe8+8T96BrCP/Q4T/ZMz/AFh43nXMkDWvfbPwrp7GY
	deZrRBPM/tFDXNOyJTLufFrfqOeE/SmEwGgbsAAB+bluzJU/eC+OYTbztAMF/K5iBwHh1jUvEAR
	5/fZfthXN8GONRhs+mrHJuxnrT/DIX8Nl05VoWKKZ1j5nHM4y1sLyXeGx2MzFTgLHAvhxWFFfBG
	gxrCPUDyPiskVXZ4hcg==
X-Received: by 2002:a05:7300:fa15:b0:35b:9851:a896 with SMTP id 5a478bee46e88-35b9851ab64mr417272eec.10.1791795652433;
        Mon, 12 Oct 2026 02:00:52 -0700 (PDT)
X-Received: by 2002:a05:7300:fa15:b0:35b:9851:a896 with SMTP id 5a478bee46e88-35b9851ab64mr417226eec.10.1791795651874;
        Mon, 12 Oct 2026 02:00:51 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm32288736eec.25.2026.10.12.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:00:51 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v10 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Mon, 12 Oct 2026 14:30:48 +0530
Message-Id: <20261012090048.2495379-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005060630.3323963-1-ajay.nandam@oss.qualcomm.com>
References: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com> <20260930-master-v10-2-105207bc5275@oss.qualcomm.com> <20261005060630.3323963-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX2a9aE8jXhdxe
 wPbZiOankGu/m6feX4lQN0A0v3+LqlBl+5ZiOC3dBxLt0Az/cyO3CL0oCDO/unxyRAWynNvMF6G
 NBYC72b8xXw8K9Jn4AgP9URCWDUUWwo=
X-Proofpoint-GUID: JhPBi3yZiDU-PzHeaRHnkb-tKZ7J_H1r
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acca1c5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Qnx3dWhjQnPlBiBVVhkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX5ldqLm4f7oyK
 gwjAzQciNnc2UofGt9bTUaXlA0w/50KtHJ3ShS5L1matSELs0XUn/yx6urNM+kHlNA861WenfW4
 K5jh47lu0LNT383xOUm0wiAzHOHLKksFwmSJogo5lGt0gHxVBoSM3ClGhOybPvlN7IghZYzUVjF
 9Hw1vnDY5raCeb6KOhCT5mKF2WoIDkE7EBuXtsL5aCjUY7kqyawKK/Yr0liwpJBvu3bJM73iSrZ
 Y6vd4sRAEv9VPdeKkC7xxNR8slrsEmLnOpgTGmOQAaNMl6oGu5993kDVHy6T3sWBt8eVnT6gAaf
 qSTZkVUgZIsvveTrjmY3c5W163+hHmU32XDtPt59AuUeUkI9P9HrMy1YolAkvlUjS88FVTNMgZd
 HxD9A3QjwOpfizyyDeS0EuhSmX3ojh/2tTCd+hs0M23/ZCuvmLKe5xu6X3aU8eJezLmjnVfMhl3
 /j2EOfkF2BUIU8jsk5A==
X-Proofpoint-ORIG-GUID: JhPBi3yZiDU-PzHeaRHnkb-tKZ7J_H1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120035

On Mon, Oct 05, 2026 at 11:36:30AM +0530, Ajay Kumar Nandam wrote:
> Since this clock is registered with devm_clk_register_regmap(dev, ...)
> after devm_pm_runtime_enable(dev), the clock core should already mark the
> provider as runtime-PM managed and take a provider PM reference in
> clk_core_prepare() before calling the clock's .prepare callback. It also
> drops that reference after .unprepare.
>
> So this explicit pm_runtime_resume_and_get()/pm_runtime_put_sync() pair
> looks like it double-counts the same provider device rather than adding new
> protection for the regmap gate ops. Is the extra reference intentional here?
> If not, the custom prepare/unprepare callbacks could probably be dropped and
> the driver could rely on the clock core's provider runtime-PM handling.

Thanks, this extra reference was not intentional.

I will drop the custom prepare/unprepare callbacks in the next revision
and rely on the clock core provider runtime PM handling around the regmap
gate operations.

Thanks,
Sarath
