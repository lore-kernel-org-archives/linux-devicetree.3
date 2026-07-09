Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676443C1974
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583099; cv=none; b=d+uQ5Pxrk20e/eSWR++a2OjDOWJqfAEzXEXWrEOXgy6KvAaqD5m2UMc9xenNrsRafZrAThzDUCJC0FlFUUffH7uiI7xQsL7lMtLtKklygNUO5Nf1LLGSiE3zrwN+IKojyFX91V2OH0MZK3ij0mF5uS9KXIsibz/q9ALbwgMJAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583099; c=relaxed/simple;
	bh=LDfUi4NZBgfLrHI4B/s+P1VjuEhuEUnOiCpkxRIJFXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSQXcloUmwd6gJwmb321ROGHJ82TIWk9wJg37Urewg2+LOh7fg8Eipn2HV+7wfaNPX2c40QZsEjdUAvZdZLZjzbJCi8zgHRKXBJGpOHFdcVJVqFoAihh8/thxB2JdcxPgJyjYXxYLCk7SF2+8FQZmv9WqKJzGXByaNtSYzg46XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUmEcQ5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBImtEa0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUmEcQ5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBImtEa0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960H74749792
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67btAJqJoA11VZfNhZNlEX7T
	AwysL2FeNXAbd5m6mXI=; b=fUmEcQ5fNrKMRaFMON+9uWDyKpxaNZ2wmND69fld
	GuMkYzHrEMJcto9pWUifWxdW9+y/fA5OIeOggFBHDJdjrMWqorB5HhQtXBaNUAOq
	9kTtir+0a6B8kylB5CpSCEgZQ57xystTcExxcPDnjdLeUNZRtrlvO3pLUsVZDGDJ
	2Al8gSp8vtb/6/QeTbNzvcbrvCW9DE8i/rIwoSOSTSq3+BMmweFudEPHIP3pwuN8
	OOMhXO6oGjh5aZ79iqOrarDTcdQdbKh1H+7pfyn8A9BPtxS9+FxlWKdHYPN1+WaD
	+EzjtWG4zRyvDJ6Ji5tN9cDwhMg5Du/c/pVzCNQAANuetQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfsxw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:44:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737bcdb48d2so463575137.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583097; x=1784187897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67btAJqJoA11VZfNhZNlEX7TAwysL2FeNXAbd5m6mXI=;
        b=HBImtEa0TVu785iY8mLdUBUszgZvEJXZE45HxdRfYFIvJ4+A7C9ac10LqeZjWjfUhI
         a/n42lZBR1HSk5fhZa0JadgqpzyorFOQ31wSPHqkNZ7p/y1qb5hveo1K0i9KDimi7tVD
         ylbFbq/qreOZxJ1ZsbVvkFmNlDTFlRKLckchjbtzE4hY0C6tOy4Bzb6ThWy4mbuwqOmX
         0PnrJBbIhUMleCu5gO1JNyevJ8eShfXVrHFM6+rR1AdwS/hmmVN9vA1yU9CPU8IgyZiu
         eyR19pjyeb5TWvlAXIxxhxify7N4J9RYo2qdf1NsnLOwx+lAFCmie8ldtt9mQSnAC9LI
         6TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583097; x=1784187897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67btAJqJoA11VZfNhZNlEX7TAwysL2FeNXAbd5m6mXI=;
        b=fWxQUEjFWQ3x+WUFFKacDHoSNWGTQhchYZpprmRedtN/4Ee55NaV8ziilCbRM3yLaD
         pIkAlFrdhYJpByoKUk7FPrMebW36Tn0nzV+Bx5uVi/1tGunENh3wtOIL/xwow4cUHJ6M
         xD5vqqkG32HTjIKS3bkN5py1/tZhyLZKMVn1IpEHLSjEMAHiZVUI/GpIfjsKM5rDnzyS
         qfO4omQZMkTtgaQQGFMkC0vSa+oqQ+7kFiONFZDHFqFjG2RIAez3cYJPQfwqlPIbpumb
         Fp2X0XK098ifevtD+tcVj4ll6n9LabI2XcuHlkQ6h9NUp2g8BSGWA5aiTebGAwr3dKJr
         qHTA==
X-Forwarded-Encrypted: i=1; AHgh+RpDP8YQ9lhwbdKEyHtKw11XY9sg0zMj8vPVSkhqT7Dgg01r7m7KDxkZJiAg1klSD8TVS6aUOoZRMGJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YysFaDoVRUc4mWybT6h+tzKTxKhlpeFl7o2E4VC9FHprY2JKaUV
	Z7JdclEslYlElf2eV+qiXEYlMiatYo4UKglLHfmqNTyUB+7ttsrv4pzFeuFzx+dRfd/gE561/Vi
	2SM82GfJuPTknNcM7BZ0mXo+GWMgqHDcufky3kLa9Dniq2PAZXRmkEjJhgGHS0X61
X-Gm-Gg: AfdE7cnn//zEh7faXfkqwUcWHZ7TilhnGTTgAlkD1ZNfyvEsOZ8p9wkSsQAq0DMaIDO
	Gfi07+9uxvPhwzAcaWKyWQvaZId33+wtZXu0pWrPFy+WSQ02hPlWPHrPGtMGagUglGHCa7y8Nhg
	PXpKMlzwNfaLvzK7H/UBTpjv4KRkMqcaNZlXh7GoQWvespQYhGtaE3Nepz0kPzbB0FTpgEhQFMT
	55o0/IGxHuHKW53So2DgcK2Mr0h4bXTXiUlDodz7S+3ZEaFo4ooMlZvBbH4JKcV/NDlkZGsYtGO
	dqRF9kWyjUXkdkBI+wmup9zjo1NSyn1VFB3clernyedcz+rDJrcLGHID1tcZ/p3TjRSNG2GDYBm
	enwVFdp7G1+1g5StBmZEtNZPrVOaU3ZTkIwyqmD4B4NDwguVa7J5tWjFRllee8Pe9ZSjvkuh84Q
	VtbBukBbRtSWkSeXkDZ71AHeBU
X-Received: by 2002:a05:6102:5122:b0:737:d207:5608 with SMTP id ada2fe7eead31-744e00ecfc7mr3803444137.21.1783583096743;
        Thu, 09 Jul 2026 00:44:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5122:b0:737:d207:5608 with SMTP id ada2fe7eead31-744e00ecfc7mr3803414137.21.1783583096218;
        Thu, 09 Jul 2026 00:44:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b00cd21ca7sm1444264e87.56.2026.07.09.00.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:44:55 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:44:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
Message-ID: <vpsczyjw3ew4lhjwy6edzjomryna7ygyamgr5idw2aiq7al2lh@64to3cet3ufz>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
 <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX2Zp0KVaVZ/eF
 PM4MgT8yxrK5wrvS69ofCaZrIgLbn5qEuZS955BhUFoX7w/k7mSF2EdkGXhKB5X0jsS9Oj6wLWy
 P3wROOUuAghoVxx7TgzsvUaNMarfQHaaTFrlxdgyHntXAhH4b+nZN8ONIHbfkbCApTfBDnj88kg
 2Q6g7TOims2xpuYrw3LZDHCXD5+BmtOXEZ0Cy8rAykg4u0i9dKiNzoRxfLlj87Wgdal9yzP8e4d
 7CCFAfkpJq8PcEHO9QKNAxsrISxlVhI4hgmd3m4KKp1K1T1CYVdjyV05LpAaw8l7D1pSXMKzAL3
 Q+yLtAW9YC1ZpbMrFLYMaf06jmqP2SxcOyEbw5l1d786z/rIouERZXg9jnWSW/bV16Kbb7PxkZW
 8tXcmjD5ekc6Q83PztDrErzrR/5aVH98eRqehk2stBJEret5he8zfk1qel3/np3Podfa5/XqAs2
 rQXegoPzBUSbnlqomZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX5vg051HYlNnA
 +gheTba9YLzflCqstptix1jScV4jLMc1bxbFfzxIq1LofJz4UhdJkDGEGa/fgkZg+xowbEMJrKJ
 kwkx1KNJSZDEEZg7wSkWwl7nTL5q7l4=
X-Proofpoint-ORIG-GUID: S_zOyW77zEQterDYhGAQ5rhsu1Ivk-jA
X-Proofpoint-GUID: S_zOyW77zEQterDYhGAQ5rhsu1Ivk-jA
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f5179 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MVNNC7U5w37-LmZrIMoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090072

On Thu, Jul 09, 2026 at 12:59:40PM +0530, Wei Deng wrote:
> The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces.
> Hence, describe the connector node, link it with the PCIe 4 Root Port
> node and replace the static BT serdev under UART14 and the
> chip-specific wifi@0 child node with graph port/endpoints, allowing
> the pwrseq-pcie-m2 driver to power the card and dynamically create
> the BT serdev device.
> 
> The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
> controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
> (GPIO116), both described as active-low GPIOs on the connector node.
> 
> Remove the chip-specific wcn7850-pmu node as the M.2 connector
> approach replaces the WCN7850-specific power sequencing with a
> chip-agnostic one managed by the pwrseq-pcie-m2 driver.
> 
> Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
> to allow the PCI subsystem to associate the DT node with the
> PCI-to-PCI bridge device.

Separate, unrelated change?

> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 129 ++++++++++-------------------
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        |   1 +
>  2 files changed, 47 insertions(+), 83 deletions(-)
> 

-- 
With best wishes
Dmitry
