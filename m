Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481648C3FA
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711116; cv=none; b=eL210ANQuN6bcdKbzD6qYIETMsiM1S4JgQ9G1n79PvzIDh9xTA0PVFVf0LrAEppIzE+ofU3uUzyxVxZ5ay7Ym9KoG95ERBp2QwCSLsSOYqySff4enq7MQF4o6gz3G0ghAGg5/joLaYEjep2fK6J627sJJoqkaMp3CCMU6BkIlOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711116; c=relaxed/simple;
	bh=baQJb7Ar7ZmU1hhzXFo7f1CrbqEmCoDf6IMkGA3MRCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeQ9NAWiqdXbwcSqMYu6U249MzMV5a2lmGdnmPe6msVqM8Ehx35DJKx5c+/L8RUBMDvpfNXkdmnsIqr2CsL14WhCTemPvguOHOFrGuGn4ZTPTc60W31NIESykYGfWH5bm0agBCKemrZqJttQl5234AhGc/5IRzsQ6A3nQqBfNQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lb+Y2MtE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C67qv04s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lb+Y2MtE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C67qv04s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xdUn269871
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ye0pmBSQNQpD1Ixqlj4iy6xz
	BJOLNvLjVgnEcTk9udc=; b=Lb+Y2MtEJL6mOdAV5TsbUJUb129e0wN+miUU7+Jx
	FKNDJWSplwfsPeWSA75BTsexEAgrOjgg8YE2bYUvzSLlzXEUNJVCXwUydVdYS893
	bOdOWNDMD24CoHqRbkKyJEpijqOu4bn7zvMBMriMWizf/yS6JtJy4YcagRetnnK1
	gknUkbWROgC4UKkN0FHfoH55XHKq7TXfJNJhzW639SSxUN44c2xVgDSvcEDLXlDB
	hCs2m+PgRXrJJWWXe+ORcJfN8vHz/dpE2IHrec4BVz/eTrs4SYxmJFR5yXpAhA/y
	BQNfKX8Zd9oVPNXcY8UD0aKKtfcdblHCz2wjkpuoVOdsiw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ab5tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:05:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso15006498a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784711106; x=1785315906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=C67qv04swalWK/ATSzuejVNLhHuW2WKxREPzMq5yRKkNS0itGeX+JI3D8guJzERkDD
         nejvczhS13j8VFo13+67PabzTGy3axFt2rdFR7iUlh3jXOVwI0Ewx86Kmv2ywPni4HkY
         HwvF88Ul1l2issuFIO0U4d3I9SbYebqzY1O2RQbU0wwZiVkad7PqI0qpQcx7ELqLE5tW
         wB0A5psEsRaz882Xwjd2zGW16eLN1o0dQRZF0wEtAALOcVXSHFqXIcU/WRGg6wU+remL
         HmsHxSj0txSMaDw7NiviHNndv4VC/2CCceG12B3qXyJ/kyRrF0SXE3bs5ba7qElz49f9
         gSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711106; x=1785315906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=tArmYtpoABUyo1Z0b7hLoEBJLdAGWFiVH5G+OY6IHlWgjHGCaUW4+KEnI10ysZQcYu
         FJns136Dth1FD5Tfwpiw4dCK/NySBlBVrYEphJdDxS5N2W/pUlfqEaVjPMTJLLaE9Nqi
         pAx9VRNOhJQ/zBA4tSKz2bW5uuc22OIf5HgIvNJmVJ9LbQFh+4ERPPfE4H220n5GnZKm
         z3kPbwrRr4Kt9UEJzDXoOLTXorLXh5F9Ubr7WJj4xk4sq0DTKOKzQ3yQrY7UUFRvEVOj
         loMNrvzwByUeO8RzJ1FI/7Z/O1KqUJAs3ot6vBqTA4f8tRTfoz/i+5FXfdg2904oR9ga
         gxCA==
X-Forwarded-Encrypted: i=1; AHgh+RrCzL/1J6Ez6rTpShP7KENr0K/fRA4yk7VmqiEvDaeB67sqlOTKfyeMv9Xa0Ngrc6I2GKzujYfRVptQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzXu33qYW2Wa1K5TVP43ZqahBa/zr3d7+tYDqkE6NK+2Iatr6Gg
	38MF9PUMzcVIjVsenEHlzAo10N31l3KLm0pOo56YKnJ9EoA3sam95/Bc/A5AMhDU4FF1CB1kzCh
	QSphmSFRrWZi7prT3SS84Xh5gcjO661GXZ/XvmVrcrLdq8zWW1/wQdtP95vRd8kA5
X-Gm-Gg: AR+sD13T70z8JHaiHtN/Nl7qVNd1Lm5U2iI5yCuXUmmlByXHI2lol7GUn99i4vRPKMU
	XeAXlPfYPWFTkc6EXxmTv0+6T+a3KNEjJgSTDt5gea6jsG8dFLZDiGE16DupGnztSrO+ZZe8SaO
	G47HVwSCFpO8rYstHUOCNZoVoG1ilV2QRa8sCtE1IsaY/byo6wccAJ9EZSBQZzSpEq0iI/1UCly
	x85c7a/ME4J7sr1QjuNxhKwuW77KcVQ31IWqi3SJVL85uE1eVYpIqd5xhyhsaQFbWpQdR3EfwIS
	uyGn4sZAU1W3ARjU7pDdNYD+YZ1peXb5rYsYjc/FenUyCxdOY6CxhFzwZffF6dasSPKD73U6jkE
	6anm3kwZWIO3y4uc6HL3umkR4H/xk4q6D6w==
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634853637.16.1784711106464;
        Wed, 22 Jul 2026 02:05:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634822637.16.1784711105994;
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm6811568eec.26.2026.07.22.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:34:54 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Message-ID: <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfXz0AH6DhNX5m1
 hAWOpk5pOq2j6K36AXGG1ilyCCnKyXY5+Fy8W7RADf80zcm/Jr569StlxmYVBfbfm7czgpDiwzQ
 B0nM/HVG9tP4G4h1ujmWMcjtcOqbYP5i3Cj7LjiKiX569icS84w44cldDH8S/HnVku0LNYOFA7k
 AbCe1i0wEPD/DZztZp6WSpaaYfnlfYe8FEGRVHypuwHjlhYN+iiPRvsLWimvug0gc7HIm+fk/PB
 holDufqtJO4pQAb+0AnOrbmXxn5ighQwkbKCmBNu3MpiyvjZpKv6SjIMjvseTAwOWU1PE4oKwK4
 zfsfLJwiENu2Fxc9BiC7dciUuTpYHB0DYmz9QhQZAj8pjmzHj89QaiLbKR3jrBsmErz5CXnU9Cf
 XrI3blYCOHySksxwgVOE5IRkm3y7TEwpV2mdXUjG1a3D1FbiWyPdzst6M5ln2OxCO8c90lqZyUm
 YTrOFLZ7eKivMVnwaoA==
X-Proofpoint-GUID: nPhn3jbPFDv7m6Y8LDfuiMF-IEUH2EWu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX/snlHTp00z6L
 3/22HhiQfM2sbWJU2Qor445cvDALr81GKvD4ojfc3StqDTAeM11k57G44FVpxY3UGzELJESjZ24
 V8Xoz9O/Z+6GDZZLHxbPHJZtlImtH1U=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a6087c3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=2P-C3DqZnQur8SwEehsA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: nPhn3jbPFDv7m6Y8LDfuiMF-IEUH2EWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220084

On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 34a81e4b4f95..b216c7595f7e 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -4,18 +4,34 @@
>  
>  #include <linux/types.h>
>  
> +struct reboot_mode_entry {
> +	const char *name;
> +	u32 magic[3];
> +	int count;
> +};
> +

I see some where `count < 0` check, should not this be size_t or u32?

Thanks,
Pavan
