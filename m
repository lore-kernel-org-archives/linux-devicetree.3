Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705474;
	b=zmcUtsAHNrBSlKS9D1tQfkfF//BrulwezB1qKaic5/h6YKZR6h+3rFXhy+anPfnDpoXt
	 rdQIuGYjVhP7GbgpJXKNhl9Q3KKC+TuguSsYqVF7Mjzjya3XEmxC8XqXFz6LqNfzaouzC
	 0vpVLwcgjO6BgR+rd4CAPr945JbjBDIvF9Hmnk0SMYKyCIGDtt+6LnOzhsj7iZDetyxLY
	 B6zUl9E8oPJ5pzG8cDFevqV+dJfm9lTE/oLy9noWwA4ddSaxo2xbK3CVGCzn0bS/3l413
	 XsHRBxF0hH/TvjviNmuh6pwva79vWRzgoebi2qUU+A1so9+OiA0MKSMyi5hWkvtgrWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=;
	b=jhs8/Sjf9beMt1WaUDPbX4EJejfkiNeF5hsaomkHGBcORt+Y++z/DNrZ38jDOyXsgH+p
	 7TX4Ph8RJa+32b+oqkYsTV19RjA1inHVAyZVz6Fqb7OpZ3HVGA+YbmY3jZYrAWrXthw7f
	 /xK6TH21UimbA7CxkkbpmlEwcvrJOsCDZZu2Kh3j8E/mRvtxQDyMdQbcXltW4YSIZa1ib
	 cWTevYrn9AoW5Gx+6cONVtKZpFUJMqz0Owh+68oQ38SH+wAcNfulxcyP1AJchKnxj4ZWa
	 vKMv1D9gkMZICiYZxGxNQV5RFpIcdwh22M8toXbbz6Wl2o8/+N+cI+8Cwd1cddgiTGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k8DNikOo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrHYCxXR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FE606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k8DNikOo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrHYCxXR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVYA23298799
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=; b=k8DNikOoSI2S3MBz
	fZuUPZfU+u07cuI7NOt3O0TJXN+eaDNhO1DLR7IIGRAajVtdFI3qsEu1vIDqXPYb
	dbsoauqdtbvh9fjbHXl8TDM9X8/csRFc6S7ra7eHYmSZcRIINOpLEGTiDd1orGbz
	dIbRk9xO7w+ed1ExPh6mrZyc22/3wNaSTSqNMqtX7+yQjzx7c5MsNQ0Fd0bJlc8l
	7l4lHhiytjpNIi23qILZxqCyYXL8I5G4CjHzCwUGORPtf9S7QCh/nQ9cEjlbGyB6
	BYf2cIfCOkszQ/FT6lHQCnne7/i/5a9ucZft/6zxUMt4BUnbX+EwOnFX2utqGljj
	VLrQgA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02rmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:04:32 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-85c1135c288so1057364a34.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795705472; x=1796310272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=;
        b=VrHYCxXRC+MX3DmeVHIXg6rg7GxkXBxzjo2X2IaJTLsWNt3DRKkRHtjWDTFXiQN1bJ
         iNyXtuyAV0sYqiM2coIAkTezJmSe1Wdx+KMiIVF+U6mo/t+AElT08NZYy3PwEMFlnJ5Z
         fW0F0U7xpvVkKbI+6N647iM2SmUx7KoYQbcW0iloed3jctuqRSt9xnhDr8NLi4l1GPCF
         PD0lENazUS1uLinSfIYzxVTZASDl3f/q+J1c3aR2aBygRGDDG11w9Q4CngrOkJwip9IT
         n4L/MwOEnLfl4+rgUGCRXnlGGF0xd4CCnwq/KBt+eAeSa2kwEae2jU4msJUOJ/sd3qdd
         r/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705472; x=1796310272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=;
        b=EOczBJKLNDc1Q7HaDPr+iBoHSbJHqdC+s7LU7cig98X/mbYG61sZpqAHId8JksHA+T
         CcMB5C6bf4ZY3jehJjpkN8439Qo0JuRWY4nYTkPoAdSS7HMfxt8zc2SWlMCi5FofYT5u
         miOkG/EoHuqBbXrl1qHvCzTIEsqrzWfv7da13lSEjVs5xNcPF+WtzO+AbO8ec0ecP33F
         0CQb1FP/tZAcCCQZiS5yjGxLoTnaCcEBL8eO/PGQXNgZVZyaTGrBe84IcXyp+2m0wxRd
         mQ6trk0V1UxUxGP8yWK4L5ZPo+/3zIh41QaLmwl83N67I58W87sbsO7xUNuwlBJIAn61
         53vw==
X-Forwarded-Encrypted: i=1; AL+hErGQj0uSALfDufI7VFLgO0hqGTrhUsLojS3Q85Bx7KtpmJxVv6W+PoSRUDCtW+0y2CIOqrd2C4OD4hcP@vger.kernel.org
X-Gm-Message-State: APuU4Z8WsBlcEjW+JBXu68Ui3zkb1Ut63Fmfc3/Zdd43+7XvVcVNH6Pf
	lp9AURW54I2/11uqwOvMUFSItBM2wCDZTUW0aZVfM594qIC/uEBO0Ls+U9qSX5E/tZ00DIYWU8Z
	ZbRJXp21JijhCEdSEX+tjCcqqzplXwZ5TRwrYOa3B/EpzMjP2HMa0FVZHUChsz4r1gvb1jBaC
X-Gm-Gg: AZFdTZchBPapEsHkueYzNFDnMjhJCQxS/j9dLF7mdJhr5MIcUmn/0RMVmbJ7LURw1z7
	eBEkft+dFMZ/1FIHTX/bwx9+gNPLqP9jXCKBmkn4ylQeduIhr/YBUpD/POQmqjn60zTWX2r04e0
	S/mSXwALxyetg6IZBSxcvw0oxdWghIF0ulEAgihwS/e/NhX1AYCDHTSdWcLCoHQ1TKlTN/ORzoa
	Ov5oP0a1DxqNDkeoLMW3bQyATu1ondHrIiAOP5k62Vh8K+eukjtvYw814ZnHQtXBz3jJGW6z8MH
	xbk1wzw4FGGyQwMHeOt4VyBCEjol07vE7dUJLTuoWl3x6wgPjVBVDis05ksx/IcnefiHKy9JS8B
	7VE22SnyZ1iWAImXN+sK79B2j8AqkyuJp89fbD8KKU2g8vZb7pqWdzYgq
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr21002905eaf.0.1795705471777;
        Thu, 26 Nov 2026 07:04:31 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr21002869eaf.0.1795705471359;
        Thu, 26 Nov 2026 07:04:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9f705sm766108066b.42.2026.11.26.07.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:04:30 -0800 (PST)
Message-ID: <c06e7955-e72e-47a1-9cfc-1d519cf3a33e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:04:28 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix
 touchscreen power on
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118162343.16197-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118162343.16197-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b084a80 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oWukJj1da76sGXFo3RcA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: Y0C3BqThSh5KzANMCCTqwE19cxC2hCvv
X-Proofpoint-GUID: Y0C3BqThSh5KzANMCCTqwE19cxC2hCvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX9FMjufN1YVC1
 j0yGli9C10R4nZOGliMVfKF57YjUUufupTGcbeEIHilTnR7anfRsh/BpMIRqxItrnSRTa35rNzD
 YMonOgAsdZi4NAvoicmZMIK0jNRU+qpXigUyd1QmANM6NgSDsZbQfzQKY3McbYpaxjbT06QmCTh
 zKb/1WGVju0r7V0BwRZerCTC5Rhk9is+FXsMPH3OITMMuNYckEpYdJ2GzWhtn0ebn7HJB2WdJ7u
 0EyZtzRRhYEK0YR3ekJ0DGnzr02UrbhRBN/NGH78PJRbpGrTjQhw0OK1taQ41MrAesiOzWwHDdb
 /dimp8uT5U/ORqFzznb7dJIlgwwhmmlfIcV3NUsTI3YQixfYJ0tbuMzZx1BFdKEh3QmbGr8Aa5+
 CK/sZRDRd9NM8LQhl/7a7ERCOTRXfl0PwrMKgdwbAs4el8IoHIuFzB5lM6U6wd4Sa1Nti+Gxuo4
 /YngbekmBIWgwm8bqXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX2fkTbaaL5/p7
 O2ps3YIod1Lf1lBQlrO9iXfyBUfge2S3NIZ+N5bc34wEt9okGC6Nza2q2UZubS2njMCvDpIecIw
 d6vIyIM9uLS/LgXFcq0XrqPu3UIC92Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/18/26 5:23 PM, Hans de Goede wrote:
> When the i2c-hid driver is builtin the touchscreen on the ThinkPad T14s
> fails to probe at boot. When the driver is builtin the touchscreen gets
> probed immediately after being taken out of reset. At this point
> the touchscreen is not ready to talk on the I2C bus yet, causing
> the probe to fail.
> 
> The touchscreen on this laptop needs a delay of 200ms (taken from ACPI
> power-sequences) before it will accept I2C transfers.
> 
> Add a post-power-on-delay-ms = 200 property to the touchscreen DT node
> to fix this.
> 
> Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes v2:
> - s/touchpad/touchscreen/ in commit msg
> - Add fixes tag
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
