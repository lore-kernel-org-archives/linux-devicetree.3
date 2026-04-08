Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21135E959
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628369; cv=none; b=HWLuqLf6JgS5EtaZskckhjEtBzsmNrlmuGOWFfQLAWpT4bHHCPgxrVCKCKalwOJGByqFktdB5phw7e1GITaeuPbQcFcol2RauExWE+ATzWz12ZRNzpiglAYFmqjuOGV0aR62ptQkM5Xn29vx1tpc346J63sQ5XdqWLDZzJ17u+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628369; c=relaxed/simple;
	bh=E6KklF2p6JB+pfj0G9dAm/Uj76BZjD5t8kWTwUyC3X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7enKnU+TkLQDgNsDiAiqLnna/IxDyH1CEFUBF3UxJv3Vlf+C7ezj6hwRRpY6wxjz81bPousZnC1IT8o8RClZugYRZ9QtuLzWQgfldS3Y5Kj7oBzFlkJ7Au/M8Wd/getBiLG7QIRFAA3qUJvfLCQgZ/fcW8QR5vsm0pPtzZH774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCqbc9db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSY/2WxC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCqbc9db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSY/2WxC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M4i0I2861287
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 06:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=; b=SCqbc9dbcvjp9zag
	sXcMrMzInXJcsKcg0+8Xl8KK1RqI6vj4HzVBIQAFpmUQ5sjYObWGhR6ZHQwBqHxn
	XMZnOd8HreqbHjJdpx20WwTwZc9MM6ebnh1NoDdJtxMrLrXFHPpnLFUcmWexMZTY
	Sfg7VeKUk4/zmDJrQNlLPIzE/7mjAqXCzPh6Fy+PIqE089lBV6z9RLtbLHJnlLQU
	dyQ9EhlHAH71NWU3vHo6SUSHnbAdzhtUC5w0yYa11k6haFbcRR9vp729x8WkTsbP
	tPq4apZ0DnGjKtOXpBDUJIw64cmNRMLo2HVpXVudLOIfExcVNRnZaqFlKwhQ2mCz
	pMhoGA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8s836-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:06:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso12844114a91.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 23:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775628366; x=1776233166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=;
        b=DSY/2WxCgiWaUYZK6e2SrBuV+mJqahZghhYWiCRa7c9x+qlN3z5vLIjpcFCQd4PDZi
         HHEkWjUWPBl2JMmj7FgiEXlhX1qKS1mB0LpNAvxneruRruoQAU0ZxHf+KuHcamRUlOR9
         MHQsTeqc1MCVExaPOxda4MdCFu/K/0c3D1tU9u/ajeUhw84mIiF7N2x6GVcFsm4uip0v
         lKE4sMLk4b9a9TErygzVcW49cpm/Pkc9ym5bP/1PbWw5mCk4MIQxYfcG8PaP1xFX93Ib
         cwPDR+3MDOAthh4o7UFLoALpGKiTsdFgvLLx6RYV3O6+hIg2GWsQ+AlzG4JB/E3BTsom
         5RgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628366; x=1776233166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=;
        b=NWuWJmtoEzhef87jPDcfYBp0zudVg2qrwwatoLRkvqt91rSC/zUSo0qUb6DsK0WdgV
         oz7KJPX/owF2DEw8j/bRaslcG1nQSvFKUHXZtppV2kjrE0+tK+CMOA9DkUShuKsTBcel
         5Sne2OTGdsBG70evSX6X73wJG1MbbTQHFBBVrU0un4Qvx1Bx+GR265ZRoT6nIiM+qUEu
         xrk+swH5FL+5aJp0dsuS0thM7WKDJnu8rdzCHhvuozRI8hAFzeJldWXZi2AHuR93bIA7
         YiOv1A2WgALQLt5Nxa1Hj8kYgdvCqWv54jciUVcwBUbKh77QnglF3nF3iTdayelG8xk5
         YZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQgv9kqfvFSAzwUdwx+pEcDjZ7ZAD2hQvMhcD1O2zGYMIcGmpoLZk/aDtD7UFpQvFYuBMtqjQB7nhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1dVB3x8RIz0OKTc1HFFV8hMCuGDy/cTj6czEe2p0PGaNdD77I
	0A1TKnXzAzOBoVCBVP4JGWsqPdCZgZy523hJ6U4a5Q/WQdB5tn79EjZKNq9GXhsIvd5Is8y4w8J
	FSXjkE05RnJHSososlfiuq5srb8T7bqHFJsBODZR1Xj4RZIvC2DOxk5ARk+JWRCHQ
X-Gm-Gg: AeBDies6NDgrKf6U4mqGNcpjTcPGSOW5sAy3AszrCz70Hx4k0N6vaoEMFXnpDmzuB5i
	I7sKG00n0r64lNTc2fMgGTNWHsB/Pzdmbh68l15rXLK4U28YAc2n5+fS+nymw4jDREdzDDEx490
	QQB4ckYH79QdVZgR1tnMr2EOLkppZu5+D93L7NfEHY0XZKpJn/RDkBrYJW0oaYa40dTR4cJb4PN
	bUOxCdsoeqZAqm/sS3NmPUNklV9yRaaYRtkK+vOw+fx9h/udK7zPXXQNCUhTdbksWQr2CKwCpkH
	9NRzKgjgoD3fYZXQlKbJz7OqfFVSKL4R8RV/Bl0WdZeamspiGIicxUJtpd1HHWryiUMguNanoMy
	9k0cVz0XbgQOz59+ViWfFn++lL5zWnNIkzF31QmscA8yv+XZa3DRxYMRPk6dBAhZNfShfcsZey3
	5gId2kNEqfU1nUbkgrKVE=
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr18753257a91.28.1775628365493;
        Tue, 07 Apr 2026 23:06:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr18753218a91.28.1775628365004;
        Tue, 07 Apr 2026 23:06:05 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd36a1d04sm25128122a91.17.2026.04.07.23.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 23:06:04 -0700 (PDT)
Message-ID: <ff11954f-345f-4865-a86e-759aa167768d@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:06:00 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
 <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
 <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YZNW85OJfb2BzrZe_TQJUxNv4domjy_H
X-Proofpoint-GUID: YZNW85OJfb2BzrZe_TQJUxNv4domjy_H
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d5f04e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=eKx4iS3zDsI69C-aG7AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA1MyBTYWx0ZWRfX8I2clKXl7GRM
 Pi+etFuF6WMBTFa8RPnguswSwS1EdM6QrfPkzSvc51Peg+Z69jSORZiFzlt8Rf0NYLGHjJBLpvI
 IM6dSFRBSEjoCt80Gd0F5X8EGArfwLwJnCy14DxcoZuBn9u07I0CUaICeem/sGlmUFdPO/pE39Z
 7oNolDgzy2RKX12opulRFhtF3X7wNF5l1hvtcfPyANpcHyI7ymqfwqukVaCNPj6hNe0OjNsr0Ta
 kpl7vQJ4IUro/dHXK9RICtm/alIrJzO4wdnO4SmabcSZh5cz1Cy3MmzsuGw1XBBVN6j5InfZRJ9
 DcQdSM4NcAUtShRVZpBJ5KTYUhM2+ApkblmJXUatjfOHnCgA9AYsckPOem7wb4JJakBdbzznVaa
 wk4X+YgqQyDC49WHVRn70s32Am7YP5acteVgxm2Q4CNaOOPwS6iGd0A0hUjjjhw5vrnhCJZA7Wu
 0YtWZeU2a2izHXMmeKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_02,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080053



On 11/25/2025 5:57 PM, Ernest Van Hoecke wrote:
> On Tue, Nov 18, 2025 at 12:23:20PM +0530, Manivannan Sadhasivam wrote:
>>
>> ath12k doesn't seem to require a calibration variant. But even if the user
>> replaces ath11k chipset with ath10k one, the calibration variant should be the
>> same as it is platform specific except for WSI.
>>
>> - Mani
>>
>> -- 
>> மணிவண்ணன் சதாசிவம்
>>
> 
> Hi all,
> 
> Jumping in on this thread to ask about how we should handle variants.
> 
> We are using the WCN7850 device with the ath12k driver and received three
> board files for this from Silex, signed by Qualcomm. All three support the
> same board (SX-PCEBE), where one is the board file to be used for the
> US/EU/JP and the other two are one for higher emissions in the UK/CA and
> one for lower emissions in the UK/CA.
> 
> Since these are needed for regulatory differences but support the same
> board, we were wondering about your views on how to handle that in
> mainline. I see that there is no support for the board file selection in
> the device tree for ath12k, and that there is some discussion on how to
> handle variants in general. We are using a device tree-based setup and no
> ACPI.

does your machine has different 'model' property for different BDFs ?
does the existing ath11k 'calibration' property based mechanism satisfy your requirement?

> 
> Thanks!
> 
> Kind regards,
> Ernest

