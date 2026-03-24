Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAF381AE3
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391046; cv=none; b=FSSHiatgd8BiBXiSSoQ/53lLS1kQint2USVj98UMQnWLmDroAVqv6gtYFw2qtDTUJL6bdkNEqlIUxFWN8i17e8i9r2pU+VkjmOH6dB9exYOfMDhbLz8Q+3n1W5TejDqkHUn6lq+2Nv0O08D3RoNKB2g7Ogbzj/brK4FdMiumUP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391046; c=relaxed/simple;
	bh=N1tKpnex4oilrEsmQihojd2Y4bKB8LOuOcsMPkqHzEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DffM7BWInPwJuyWfTtkcZiCUFNuHPXOquNetSWUpsDAizIwINyMgKOvFNhCysKNo5uDHBIyNweJSomnRg+u5dMrIdpA7EpS+o2Y/vxEof7AhVZwi1P0wpx4iTBo5K8xa/ggPah0ytsirhyfWAqc+RjMqPyU6FtKSZS+tl0UNPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt1sMeAv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ko+LEu6I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt1sMeAv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ko+LEu6I"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD8vi2146752
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQ64CWnoxSzy7MVIuAvuzLD3
	ASs8pn6BQBkngtvjFrs=; b=Lt1sMeAv2/1LY0Ttgv+L62rn4OA3bFljZY8lrfXO
	Is+7oh5YtvCDM3fGXFjPPjuiPJ1FKRA5cbsfT+9fGsUXKEVlRAJQu5EXbUj3QJmo
	JMgnCVqNDhlcOM9dye4+S2zXf7Q94xNrQMviqLI+S+MoQ5V8gb6gr4zMtkC52NJE
	fXCw4djfeiLVPA0uyOeZsZdaIjcwbfkOnubp57rFcsB+4NCH0X1GXjJtGJTjREwy
	9OpYP2JNsFulqDlXl9xjNsHObn1Tra9f1NaUEAAPhao6z7Nw8+vOP81k6ty/DQJH
	TnBK8ykLn01tfjxcLT5Rvb9gXNQqzi1t4tMwwtQYtOdzaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexuh30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:24:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so138060101cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391042; x=1774995842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ64CWnoxSzy7MVIuAvuzLD3ASs8pn6BQBkngtvjFrs=;
        b=Ko+LEu6I6Hx6U8ECw1BYL9046XshW/MPlXSXq1x6Ux+d7UaaKEh6qJuQP82OJ5olzw
         0BVutbgh5wBjauQmhyZcoNSpwEHvNIoqXE2/E//2ZrjwoEYkl3z/Oj2i/djAprQ22Tje
         8oZCsDQIftveEqMHoj5AQbk9P3NKxe0q0+mtaRRZgVBIzbLLP8c5arWow8yigC/xhOdA
         2CloMGlvinQQefy70OJadb50mLzl/b9CU3gh1cuvvdF29EUrwLaOcA9Egu6pHWGUUFeo
         d4kOgtoubKRTHGnQYxeUbniIaFPSd1Gz7xVZ7lS3AZNBq5NWMiUNRMNxKw4zWuO1oUGI
         X7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391042; x=1774995842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ64CWnoxSzy7MVIuAvuzLD3ASs8pn6BQBkngtvjFrs=;
        b=KXnzKyL4FvH1rIx9JoWbMmQyDoxilHOFXoMh95muaidmDbsyNm4ep3nhzyzOspQ96P
         TMDTyBJxOYjwxjdfETgsBkNJQS6gn5SlAsitI2ITa+Lbe1akTlxCpzU/2kBKp0V1A9n3
         q5J7G/izJYQ9O0h55pl2Gh+oyScdFov9T8lWyjfBbKyYX1Ml8+Ka7/NqmeK+aTjn1yOB
         63rDNPpALcPLmAU0/EMPgPr9n5rT8/SXRsikGxQIXPGTjOAJsilbyaHfWQ7Im9qmj4wE
         kj13BGpDYI24xyDdG0RajZQSgdVESef4J/aHcS53Ikla/h4Qv+Z2Vr8uJYxvMQURV53G
         z/sw==
X-Forwarded-Encrypted: i=1; AJvYcCVLN3KvxkCG32TrQudxeLgwGbLabX6Saildk8qTO4SiIM50fgBz53jOuI/VmIi6yUogmZ5y3kTxk0NY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn2YLKu4biZ8YO9sY7YApHHN0qDKZdVNB0eSAPQnxUazXIOcEO
	//zrMZKKfFKrvdtGklgVVATXtglhy3TaX5kk059Tx7xygEcE/GneBAWbNij6cAgpOJfNf/0f1TH
	gNRYnmU2/Te0bzHD7rp4Hwx9BaeQka4gHxtQi8L1DNhDTgpX4eodIdvOtJlCAz0ti
X-Gm-Gg: ATEYQzyCYZ8mMshVkCiUE2mZbGIGJ8aSopozrdFjOvZgNduePfGDWJKoEt36pAg+85Z
	TT74rBvCny33bPI4HarBH2jfismlu6e8H/0DO0kKnmcv1iUD/kDXgIsYgu/JoXmvwK+dw1T6v2b
	Fc8091MyB00pC+5ByUKv2DPkEoEkjAM0X5lLVkQ1eD3PPdyd/DdKk9gLo+m5QxYbEPNCdQ1BPtt
	Q0wC/h/qgPm5W4NhLA53CnGxmwoqmbCdNvBtzg1cxOQoK78cPSLRynL7UUnMffTabRFjq0wZVJD
	ELEjnrJFEAV5dQD0ir+jMpfTHrX5WhLnNf4+ZhO1onFwYNjvGNDKJbkAxBFQ1bBNfpD3pMjrG6S
	c8+9w1ASDyIxJpsZPDqxTcPAdbIpHJ3S7RjspKFaH0f0OSO4B3bH0VJrnLynX3bfTS1p9sapsTX
	dm7CJzzy9uH1vYwuNL+JNBqR/5CtRNdKDZ7kk=
X-Received: by 2002:a05:622a:9db:20b0:509:d76:fe5f with SMTP id d75a77b69052e-50b80d24615mr17099301cf.17.1774391042008;
        Tue, 24 Mar 2026 15:24:02 -0700 (PDT)
X-Received: by 2002:a05:622a:9db:20b0:509:d76:fe5f with SMTP id d75a77b69052e-50b80d24615mr17098901cf.17.1774391041460;
        Tue, 24 Mar 2026 15:24:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207393sm3518042e87.50.2026.03.24.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:24:00 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:23:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 13/15] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
Message-ID: <5hmynjbeful6ovl6phytya3hpbytrghtpfoi2gq6gatg2diz4x@j7fouhrrb4wx>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-13-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-13-d89f07897283@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfX3wU3CikVkcF1
 p4VTgIEDOtyVhcrZ3PI9hqqAZIN6CwSe2XzHKVWYRqsoe31AIvkpCFT04KVuegcrEL/c4Aplfdf
 jgWm17kgHlPiKwnpc3Zeasa+WxQ4BEyqllC32fjcn8TnwRuDWZ2hHVyA//Vdyvg9dKUFE9PQmS3
 6MOetgtoLkKFmVKy3VK/2nIhcnwL0AnFw/sDdVW+C0V7mEmUzFMCPrNDTzhYZ5SEW6x2sdweanN
 /Pzc0jcG6E/saX+lttBsD8ILC9APG0NQkprrEROJ5eOpJABUS1Ly80d3BsezTYI0oG+K+PWvIHk
 ymfH/71odNsMs8lP25BtsbIvI0U8Uj2rgjCvl0oDnC930jr/D84wQt1yL8NyT4FuPNLWjFXDjWN
 3WfYpvM/3qZINngNxQks61RZNqSKun+nXguszwAxMbmuKjzvCkZ0sjuA4yiJcr4eHRLd5WFwM8z
 Aq34ddWirm0T5lvIJPA==
X-Proofpoint-GUID: XnlMeA-vtw0xUC-4xZlsVztbL6cnq3MT
X-Proofpoint-ORIG-GUID: XnlMeA-vtw0xUC-4xZlsVztbL6cnq3MT
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c30f02 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=Kt3gK3lm-ZoS_3LmuawA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172

On Mon, Mar 23, 2026 at 07:41:41PM -0700, Paul Sajna wrote:
> The modem firmware for this device doesn't preload the IPA firmware
> and requires the OS handles that instead. Set qcom,gsi-loader = "self"
> to reflect that.
> 
> ipa 1e40000.ipa: channel 4 limited to 256 TREs
> ipa 1e40000.ipa: IPA driver initialized
> ipa 1e40000.ipa: received modem starting event
> ipa 1e40000.ipa: received modem running event
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
