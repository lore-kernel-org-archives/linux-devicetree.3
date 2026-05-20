Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7B93C0608
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271122; cv=none; b=P76IaVd3DFeUEr1i8QzZSZI8HPuQFjVnEMWLDf2L8XvabKVv9ZsocQsEzsFYogETa0Bejm7tNf7c4NReMYZUddOCGts1LOt2Kk9dVvkRGgdlzrTiuirJ3xECx1OanE9d9WtMwxzS1hMQE3YYFsPa2nx6COhsVcOP1ybyOnLHLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271122; c=relaxed/simple;
	bh=hmLDbygDqrx/H+6yKwQRIUJ+JZCAtJqQABrx9xS5MN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnKuLJr7rr33ZTazsyl5qBgrd1d1sVEdyyYNO+5VLOdBgiMUwAauEAwzp0SgvKsIIhwHh57Mihpe59L6v8/Kpwy5Pn0NGFXo/DkoaKGIeydffiBemv5EX09AkSsvKuSEJQ+KFv5RniSnmUYLGuqnplp14Aof2Hg0Q50EFtUD0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmIpiuwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkqenTBp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmIpiuwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkqenTBp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nV64270558
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Pf0gedsRxrFiXV+UE6fRj3+
	QtQSo8ONOS+Y9OgCYsY=; b=QmIpiuwFg1CehI3C9Zv5/hR06A2jwXZoN2Fp7nsz
	XVeaipdBhNThQY6OZhBYPy58m95M+5PE/+XQD1XzT/+pz1PJqs0Ne2DAV4/KcsfM
	rB8zQbpFBiXisYbMVfB433qtN+BzKE32r5E62M+a0nsfOU9t/K7BIrwMWPUHRYqb
	CN6jIhLelvTVPN5Lh1JkrvvTAa8DA2Ztyh4skqvR9zlVtkQaHNMBb7Z0aE6WTV2H
	hNxjh3A4jlOmizGNMP06pmrzC8mJRfh8A1OudhZIQNINEBKm3WOjH+cRd3H1ywcQ
	Xe9+5s0bIFJ7JBpDBmr0NWu3EWeZnHsqpRtXXDI8HG0wjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxr1a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:58:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff0bef198so132802611cf.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271119; x=1779875919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pf0gedsRxrFiXV+UE6fRj3+QtQSo8ONOS+Y9OgCYsY=;
        b=TkqenTBpsZBRiXF65Afc80PsS1RjTe7JOT7czCphRU2G995JYTpLB7++8kxBNn9khq
         GI/WC6cUB11EMKYDDATGTHgN8m74hMBw7WaEWUcKIRWxjSh+xHe8oxR0stk6IJkS2lEX
         pbV1zDIj3qnYL/OY0tct4utM77d2s7k4ORygWQj/k2dILIBpgZs5T+QXmIBUIoLwe2RA
         zdwV8m6Z0TaSx+Q+5zqIsyjWtzWbz8NQZleac0m17VvwsATaH+yiPXoacWb9RzbOITMX
         AXYQ4mQ043h04EB9kDiB4/C/vKPhg27DvPhlssAr1f3bMgWLwC52LegvBb6Anw+AWYyc
         RSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271119; x=1779875919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Pf0gedsRxrFiXV+UE6fRj3+QtQSo8ONOS+Y9OgCYsY=;
        b=A1QHK4f+wfL3U55bddtf+9ycqIbE4tZRYVl2V1BlGwf3/2/xr/Mz7RpebdLwmvs6IG
         gm4nei1yqWdkK6FXOXYVHKH4vXdjZM2VGXJ124SKW1hhGqU+o8fWOgPSlyi23s9drN/K
         c2GOoFqjKsE9H8c6PdGFbv+mXSmajpXo5N/ZheHHQKCbWBS8BmgWJ3MDRjrzFt05Ctte
         qr6c8Uv8xAHqHs/QW7sJ3pjAhG4hdi4VXAxHzuR59XHKfbrX91vqKQsAIp73Qpq/yTOT
         1M3X1vLrf437WNfy4el3GFd9sM2Ysfg7y5hxkJ1D2jkyv1TFfH2UK2+7JrhZoTn1fgyN
         kkow==
X-Forwarded-Encrypted: i=1; AFNElJ9yJRu6yDQqLpZVR1uviZQuUKGdGVjdWuZPtZZ4UK04B5L6crC6jae3jvzrMOVXaA19JyaBzP4Z3O5q@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgVZUQJlIqi2sX4R1h3HSitDlV4qoRy7AzriUTOPbCljla2zC
	MPOXW2chZ9dVl+JOkVjQaRA3ytl3Pq+mrp7gydCaIhnkyl2pnJ54MtVyVdxOh8klsHabuOfOEEe
	SMV67ZVMBKiKEl2x67aCXpGB8DLonAjc+8qYpPiknZPECyNT5ueqSQagyvoU7P4ro
X-Gm-Gg: Acq92OFAV9anrI2DpmXLAFfqwXr9O9tZCB1DGmKWmdPb61JHovv1jAUR4FxMZVVp3lf
	GMqbQ8aw4TBZBE2zVPm5YQTX7auehn1HCbW/QXy5rW8krOuwxD/dOtVBwts+66IsLaVxCzDjIdm
	hZx5Ngh0ircrIlUS0aK1RsuScGhzkC1WV+TZDKUNrmz1g2usi7I5ErH3KOOy90gbBbNp+42vE6S
	nuX234P6mAtr+yT5AkiopPojzggN3+UKnJs+EECuNHTmMHt6tm0zqPZmP0rINYbnfhdHqkBcxRh
	dl91Vau1e47VsshBJv3STnBB8mpQs9i3LFUDLSAPYVfiXDXUgT3mLSIGyTA1OsMCWW1XfM6Y7GV
	w/3gqAn0cQJpTr9ieaVMgCqKnINKKsm5YycKlhKyfTU0lrFKx++sUbkkuMLztq3UeV9Iqsaf/PH
	zYa7rYVyEuZdTzd6+0gGFw3wXJulOicZhppOZnSzjdYX87HA==
X-Received: by 2002:a05:622a:4ace:b0:50e:614e:4433 with SMTP id d75a77b69052e-5165a1d9f06mr313060781cf.30.1779271119451;
        Wed, 20 May 2026 02:58:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4ace:b0:50e:614e:4433 with SMTP id d75a77b69052e-5165a1d9f06mr313060571cf.30.1779271119038;
        Wed, 20 May 2026 02:58:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958827ec4csm27285481fa.4.2026.05.20.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:58:36 -0700 (PDT)
Date: Wed, 20 May 2026 12:58:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
Message-ID: <wobourxqghhmi4htonf2ls24mcaeca7chytmyxihbxokc55cbc@jayo6u2azowq>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
X-Proofpoint-GUID: jGjHaQY3RIZ7pQBxzrPsj-tcQ5ZoMrIh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NSBTYWx0ZWRfXyjqfC1/AZJw2
 JJoYCPHakJpNejmSlOoCUFDW0rIhpReScBM4loaE2LzT2CYCY7O8Ri+9Kw2envLdVa5LRjWP01f
 EADb60HzvqJVJohDcscsud7paDFJmGNn47hH9X2VTVosO8X1Ey21+3jEjUw8uEAJEolxq7KFJYW
 1jJRwmXEAqm16bsLgXzLbz1pV6hErFvGwCirn3ZaRfpAYaYxXY5tmn7Ofo4nMMoY8MlpqYT5L4A
 JGDjySyCWNPmkcU7FhVRaO0xN5ELqwx58OSj2MZ90fK2dTvQGd8u7J5HOg7/zBxbKfYDP/WeUm3
 iVgvjmYrazzJgbhy7Tj8RH0tovJ+FeLw3tzvj4VOme8R2zUNY6GcpzCNVBa9K4Yn2JfXaBZ8R0c
 r1BU3pDXQxLKZeeqFZDaqB0I2aIHIVF3UwNZOGROAqw5N6bvqVIKXhTHR1Csdzklau9xsRJr9Xk
 Jciy0xE3NJRLd967M0Q==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0d85d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=DFtQawWTd5gDQlrfFecA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jGjHaQY3RIZ7pQBxzrPsj-tcQ5ZoMrIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200095

On Wed, May 20, 2026 at 02:37:11PM +0530, Rakesh Kota wrote:
> The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> It uses a 2-bit VBOOST voltage selector supporting output voltages of
> 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Is it only PM4125? What about other PMICs which have the VBUS regulator
(e.g. PMI632)?

> 
> Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
> standalone enum since the driver handles it with its own match-data and
> register layout.
> 
> Make regulator-min/max-microamp conditional so they are only required
> for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
> if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
> max-microvolt instead, and update the pm4125 example accordingly.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
