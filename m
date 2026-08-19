Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FEA4078CA
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165722; cv=none; b=fV5WBc9ek5V5ck6PjUurRWlzfzk7u7qfF6kOB3vocyrMymOYwWJLNhpEp/lZQyUSH2gQrXURHwoj4jc3tGQ7KDUk7Lz4m9FgOTijbxi0GI/EgFcAJuNKbgU8N3vTibGRoyq3pdsB8vmRrvt9Tfx0pnbyqBCe28xpBny8Ac7aLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165722; c=relaxed/simple;
	bh=JF89pNt+wExytSZXMxkXOZVOBdOMKxbaW21qgJgND1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkGwVE0DGknBhjpbyvQngh1R2vBAIgiV5sIsMkAxsypGwh/o4G1Dk3V6Sp14CdK8u+/eFCixeWdV9vgmw8bYPhz4oeNZvKiiyuLgCybFv4ImCsE+NzrpUaynkuuCuiVlLafuRMQhIwYVRHgqhe7ZVLOj6K2f0ih2MlqYfSxnnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTcH2Udt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMcLvAqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTcH2Udt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMcLvAqx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHpl0Z1557219
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 18:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p8I/883i+Fw2SDGjY7bBs2bi
	TmL4wubFWVmWaBFZXfM=; b=dTcH2UdtjpVkcr2FlTbDXTwnRlPrQIr9ZxeY/xbD
	UtHWIUm7DQ6TTVkRL//18D6IR45UwtJuCs7EQkWtuNyLD5F9Ojvl49CiExVYHl+7
	zYCJU1gzLJyxUmUFQrD0tn+DyJwTBba4I5Rr5BXDdlGsuiRYmtio7LF0/i43cPV2
	+DguTxuN6bTCA7N+5eBIQZvXrNRbTBctIXu0FVhd+2KFqnO+VjrCL4YjWA8lzMSs
	2+MfeHRa2asD/POIXXvxO1zelaB8+DSFIg4O4ChtYGA3hnvu3Eo48kJRC8An8WXr
	GuGFZQ+kP6DG7QtpNQWvl2jL2dKoIVAyI6jy9iNHDMWcBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj152k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 18:55:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so151330185a.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787165719; x=1787770519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8I/883i+Fw2SDGjY7bBs2biTmL4wubFWVmWaBFZXfM=;
        b=CMcLvAqxSxK9WVKCSRpgZEuo54YqxHlxMw0dCuwdV5XftNrxS+1RIOnwRT3iZIThJY
         Xwtcla8qhFa7ozYolrPhvtb25jHwgT9c3MbbMrfUR+Pka+orliOSbxJdO3zP2GLokTBa
         HTgqxKkpu2sQnpEyQrmtSEKbds0XSq8MyELQAq50XYA9UlCbyL6GtSOEN8FxVgKfjyMj
         cjyIt5iWa+b8D1LvSQ7TOx21awz8AdbCV35UBKG4Y2tXlLXGdCQgrUWd5J9r0UdzjfgL
         XxYG/27NWpDZLKL49KND8Tz7mjJTMUESjsluJCVRuTI8sv2vpMBpktRNLmUcWCtp0QCN
         AUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787165719; x=1787770519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8I/883i+Fw2SDGjY7bBs2biTmL4wubFWVmWaBFZXfM=;
        b=l6q5VqTnwRIoLhncdOSxElGkeODNn8xnOXf/hNdBiOosJ/VoxSSsStKnNQu9xCLhxx
         2K/aYRvDZVjd3DfwHsDIzLfMkS9UmyooxXbKHc8ekSRB3g9dMCrJzdpSDa+7vEoE52Q3
         081AhO93xmGkviz+KvGiuq8X10GuqRp8Ohz1RorN9or5Elv3hzNfc42qS35dq2lA+O/m
         2tf/cy88hZzdEOytv+Vi5lmgwDgtSXgdmfOiPd1pCRw9fk6B8679hkzpZQaFdZqeSeMV
         bjOiVZKf++fMZ+69J1uhL8X5WiZ6Su5IVxH1+h87rCxCh6tMtVyCub3YMEyQG7O0YP/u
         G7KA==
X-Forwarded-Encrypted: i=1; AHgh+RrDmj5Azsol+K4isGvzvuMjvPOSeNVH4RxbSJrJ1BPRfiR2G0XCnfdrVIb7wddbjO+hD832d6L2iSMP@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkE7khwgoYB3bFq41X4n/iKIFAWkG+GYwINSRaZNPyZSigxU1
	J1QJSJl7FZJo9fbpv3/1CswPjBvFRiEDz64iP20AUCALjiBef8mb5dbDv1gawszy0de2qGGTvUu
	wOkymcopu6xWua7ySpbfv09CFckbDvImCa2fY6USVncQ89TkCs8epfZzC+k1SMHBN
X-Gm-Gg: AR+sD10Usin+ibSKuyBWteU9WC6NZqF/c2dQhiJh2+5xd1qUODLEL6sukXU4h+10/93
	pon0rauvQHJlhM7iqrBnRIF+r1DO/5V/mOaRMeDTiW+q+/FBd0eREBHcJ1Z5ff+U7KxEF89/Fg8
	SFSxlE56ULQ4IBu7GxA0XScbo26GK/TnK4yRuP1ljWDjNt2mZepn8nR5FvIK9G+ko6wemxAratr
	c5ifwmNmM42w0zmcZ+68/M69TMbFbLjA9kNBXWKpypwdUgLKSvZWEVj6GWmYdB8dIevHEcFSXM9
	6Ewmb7vI7M1XDhaJFrrUTHABJo9LgnFnSYYiV57QNZ3rsnkZ3ZcR7aey2x2C68ERWNjjaQ120HS
	3qD6VYd3Jx8RcGyo=
X-Received: by 2002:a05:620a:468f:b0:915:9e84:85d1 with SMTP id af79cd13be357-9371e2ff406mr696202485a.23.1787165718722;
        Wed, 19 Aug 2026 11:55:18 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:915:9e84:85d1 with SMTP id af79cd13be357-9371e2ff406mr696195185a.23.1787165718035;
        Wed, 19 Aug 2026 11:55:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b80a5sm7640526f8f.24.2026.08.19.11.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:55:17 -0700 (PDT)
Date: Wed, 19 Aug 2026 21:55:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        =?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: lemans: Add PSCRR NVMEM
 recorder node
Message-ID: <yh4d3236iq4kjp5gumj6sj6b2dbiwjbmyywiayzbm4ul2mqjr2@hu3ddfqxfftr>
References: <20260819-pscrr-provider-v2-0-9072383e0f4d@oss.qualcomm.com>
 <20260819-pscrr-provider-v2-4-9072383e0f4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-pscrr-provider-v2-4-9072383e0f4d@oss.qualcomm.com>
X-Proofpoint-GUID: 6Odp0cLlEYBqy5jVlYuN3Bh5xZ0hAqc-
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a85fc17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DCxrtmPwReth02PJCqQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE0NiBTYWx0ZWRfX/HfSnBKkG18h
 YNvrJ+8Ypr2KoI+dZkQdl+CfCMJdtxKBVIW009RBBAdIERzJdWt4UPuSdKaRpIJDvhIX2CVJ3Nu
 gYQYXsfKi8maE6j2K5z+ac/N39WstUATmUBCIisowwCbv55jzr8lm9+DELmLwnH5EIRJCdjtmvm
 Qlr9vhxcdidZRXvnK1Wa1OApOUiuzEy/MdpYsdyzevMk1aKPzLoepVNau9+jQ/AFIxe2A+Rnap5
 7OlJ9kAKvvnyP065ldUTt4Ln+PEqtEr9aYLGBQMpzYCPbkSmv6GEh/vTodc7jJavvZFPuomaq2m
 ujB++roVk04XKa5UojzDbQbGjok9p5OHaLmUEwD+Yy8JZksruHacZsBy4ML4ZXEtakHXVNKePY8
 oyAG2kVm6yjm3iDFzva4FRh+omx8IevfGJUeox6a+WusaYvYZde5JH2VeH3g9Ri4oyHp1tIoZgk
 NcN8yetgOWqNa0pbmgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE0NiBTYWx0ZWRfX9uMsagkiY2gQ
 7+apu2+7uBkoBd1O2vd65p85iXsqOkr19ARDCwiPltLQtvLSIKH2ajJP5HKaqlTWt9T/Ei/0Ds/
 RwZdNzUZX776t0RslCEpaLchDP5J/eU=
X-Proofpoint-ORIG-GUID: 6Odp0cLlEYBqy5jVlYuN3Bh5xZ0hAqc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190146

On 26-08-19 22:50:46, Faruque Ansari wrote:
> Add a one-byte NVMEM cell node  in the SDAM to persist the power

Super nit: If you respin, drop the extra space between node and in.

> state change reason across resets, and wire it to a pscrr-nvmem
> recorder consumer node so the reason is recorded before
> shutdown/reboot and read back on the next boot.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
