Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E11404BF8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724429; cv=none; b=V2NBW8erTpZ2yaUdgD59ShiSKvLzamwb8P8yDQ7o+su7L+UeLUh3znUPEEwW3GR0EBA2jzcoz+u8zjsSAGuMU5LOlKjnPCn2ef1L//SZ1bOX6/x6KkCIVQkwVG1u90sb74EZHAXEpYjpxmbCKtiCTsa6HMdRDNv4SLA+Amu09bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724429; c=relaxed/simple;
	bh=y0PJDyn5BtOol8KVSo5zceqlnjltVLUQGrxeuNwB+wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cn1P9pLXKFYKMBtaTfq9/NzWJUEZ7wuzj6wG6M769b/yxNx2QV3D6pjHcWO7eWtmw9AWmaUTjnr/CZTe/R5tyRmeVe5TJvfe6MVysmrMDlVf4oGjM+/bNv52jH8q1eXeXrPM79DjjwmtbLaiylDMofffuBg8nnR5LEVHPpD2wt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cejr7DNW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzkTMnSF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cejr7DNW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzkTMnSF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Do2t2188712
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=; b=cejr7DNWhZEH0b4b
	znkSo96hIsO6dDYQWfJ8576Gf7MAwEr/pqbsotQIRB8AFrf4Mxh9BT8gkaAkdUD5
	dpvW+UEbT0ACo//EVQ3r6K1qH5JQZfEcEXBTHzPGKUMxO/12ItZmXxDEP2Vc1wM0
	vkdRhJlb3sbgETbu+C7irkyQehfu/fQgz9AzLdbU/rwcY0r8FnAuf+yWmzmMHXhT
	Fd1yVRYlEkw+OrGBVfRZXEg/DVE+38M4YVZ6Rp7k1FfsFqxwcxVHEtTwn3cffnyx
	PK6GfFuDR97gVlODkbnBdzMUTK0oudEiqK528VXPciKcOdMa5ndkl62VTdcv5iou
	gaKnsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trg84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so299397085a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724425; x=1783329225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=;
        b=SzkTMnSFOiLu9zc2/FNJD4ff1zS2nvyqlUCjcSJVacwYOkDSyEYABuJEnH2V31ryVZ
         NQM1sMiG+EqliY+DRgwpJ8w7+9Qmqr0iBrS1DbSvP2250ngrP9kGjCaawTx76HlsVJ+u
         iulaPNNMT9KOo8rhbmc/iGmL0Zc/6WpIlBY+YBicYGjTlDxrWY7G4yaMKBliM+8JJhgT
         1zXWi/Wt2EDlzGqiyPHOLkV244LuuUyrEx9LWJEPsVmc5Go90couhAY8PLcuPVD3sk57
         82IHLtmSp4ynOmUkmJ9K13BH2RdpKwM+OOdAmWc0AdKtBxxT1yzTjBZvWXRTU5v1I5/q
         EsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724425; x=1783329225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=;
        b=m6XXyOuFQ3kX4VY/uHPC1YEY6XqOZWrJEJPqtX56pSn4U92B6No84mZdt5jZHFYaSC
         2MnT0LhtUoXJDEYtmZRslmGkKkorVbH6GgGDdNLApVofNsSZAMS8WWXrjuJbCWZjz4sl
         GH/en0xxD51qkPqcmWsuqDD6TDeDNIvwASKQKBZhc/zNpJfjWd/OaHcCUV79agF0JlQ8
         DcE19AvKZUoVdFQ7Kck44k+dvNzt75sjmXlSnf/kR917mE6FCsUf/1xHc+WieG33UB6j
         vQ3PLivLHz6D0Ztg7mLd3gZuPYwOzvVyRpGDB8FmfCEGkjE9bi8LyOkXJRNQJ4p4O7AZ
         DHoA==
X-Forwarded-Encrypted: i=1; AFNElJ/FS2iRSgqeqSUTUG/lB7zsOEIdmlNiAHqM8s3iQggW6MYZ2zMkx3Gz7Wlb3mlVg9bDuasTLzUCBh+p@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8JZFO8jSYr5trbPqmqviKiOc6ipDW+akUNpiKoq603wcehSx
	Xui0HhFNavY11C+QQLHCuv2nIPiF7BdOrSw/ei/ZLNqUp5UWuJhG/9iP9DmajoMIYiD5BFgPDgA
	v7VsZQYYzxmMQe/xrM9Yvo8RKn7J+kWKCSdVLEkk4LOT7xOkQjS4cdT0bBldsdtRw
X-Gm-Gg: AfdE7cnLtK+eLNvRtrOw7OLbi0ksK5+O7NhNa6WIGaL/jcMYFGsNxERbeKFuOGqPqkY
	QAwXp4UZkXFMMSa7hK5LJwZBInjDqmzfDnwqgqEl2bd0WCIdkH0MjVa+vSCmgIZJV/Z7j/DINgX
	CnqOjlOX0n3HhUfQjdOSnJBk1CNz6OhQuu0v2oKX+1w2tOF3IthlpwtOcvwABEjsJFyDivOdSHv
	NcrjDi0yXGvSP5Kdc2kIdkVTuEL0RaS0ZED40K7Ls5O3H8r5szX7HsU6WbykdS4El8FOHYviTeu
	pEQTh8PsJp180Nqk/rgVe8b7OcF/jfU33t1kp7KwpBc502xQy3FsV8kF5vE9aZuXuZyEJwv2j3H
	dm3BQRSREFr0GrYe/zbDGA6wp3CnRbH/ixcmx0zZh
X-Received: by 2002:a05:620a:4142:b0:92e:4927:2002 with SMTP id af79cd13be357-92e492736dbmr624556785a.39.1782724425057;
        Mon, 29 Jun 2026 02:13:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:92e:4927:2002 with SMTP id af79cd13be357-92e492736dbmr624546485a.39.1782724424493;
        Mon, 29 Jun 2026 02:13:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:38 +0200
Subject: [PATCH v2 15/19] platform/surface: gpe: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260629-pdev-fwnode-ref-v2-15-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=y0PJDyn5BtOol8KVSo5zceqlnjltVLUQGrxeuNwB+wE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpCNxPIX7sO2Fb0OtIcCoatdP5jodxjCxsQU/1YqFPwbJedd
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqQjcTAAoJEAWdLsv/NoTDHfEP/10Z
 21j+qEaic68CLQuNBgdz4qIRaZIQyRi53HdUwXT8kM6isFULDu5pDNwbBcED/OoC7ALIIyXTpaF
 vEGkyDXAVbzZh5Fpx1BIslvGuXi2wklBdo6eTGN3vz78IUpeb4d6m4VLnRWlfT36IHUS6DT+1h3
 6FUzolZExDbTRa8eUKgTHsZueNoWqtMjRD/6q1ABfXaSpCv5DTIxIqYPnLe/GIZLGFRIV1ivNXX
 hHJYwFz+c9Mz6JzWVJMLuE+fp/iaLBprk8wKW6WLOydKvpF38shDpUBrmdiQsye38mT+aSlL1sE
 Wfr0pqU/u4DS00d6i696v5TbTwWv8mMfteA9JBoEWjLN43gkhGSiRMceHcM27gfGmh4eklHUhni
 BnpeGsmGkYrGhdToZhNobNNjt8LhsrwfY9GQJGpctK8hCY1Eq4RQcHJTuIBLCGFU9PB42Jw7x4K
 XUL4XeOH6TyhaaGfNIVyz/ECTSBWXCOd5Ar0s92Twtl6rjLacXc9B3VPQBabDnNvh9UKshVwjaZ
 kugbHG30Vv/wx4wJXw//jwQ+EdJsZqJkqBZjyrmFdB2yL/M/0/DXU4l9FGFfciBSZGNqtCHNKzc
 d3ts2rLnwq6iYVMApbO94BjIvXf7W4Rpp3GbYF3W/H5y8m4f20s7uAqcwXkMY2RAz16tHXgSG1L
 WCwgE
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5ztYuz5/wbYj
 7+5jzZAVKlLDe6dg3ykD3fS05hoAwNLvYlvgsmrRGSB4NP/nLEodR69apDAp9w5v9sX3+7ck3by
 5OAJxvaCXSjRY+2jL5xF4fbpRu+YYYpou4h7rjK88RYUR70VNiJAlp+JVWO5QL+orCdhdkv01f+
 q1txPY1jZ5Hq06OQ7JFYPTJT3IWzEduz2gj4aF0yWC7vJXxORzBoWSbmYpMNuZWQ/ygKlaINFho
 8CfnllpzfQxFuvb8de06h3L9jQsdrxLAFpauPMaQpPJDyHwNtPfHE61ZW22ayibQnQJkLXy/mSG
 QoQNIWVuT8QuPKjEJR9aFDICXTaG2TkAGPU949mtn6Z36SE1GTP2HqXMkQ1VSOwFzgleCQfUkco
 SCt99OKKQmg8Hy2hzaJJglZ1rH9N52SOZ3rBJ+uNcGVyQMAxvC7Gws7NZcu5LaOzZAe/1N+Bp+X
 JT/MkR6VmLHH11NSS/w==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42374a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=PjYnKYjuuXkzxcC25kYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX9y5Az4iGYoLp
 aqo2sm6n4bXtcfwruFd+cQwKKoGlig91lwIYUYgyAWBstuPcrzQsd31CwXbI//1Xgkha67iTlt1
 YDJQZ9Bko90S/IIXVwDZbTVePW2j7YU=
X-Proofpoint-ORIG-GUID: dfzV3XAWzRMWy50xz1SzHDyW6liBMp66
X-Proofpoint-GUID: dfzV3XAWzRMWy50xz1SzHDyW6liBMp66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..40896a8544b0a4da4261ea881b1eaed62d93b32b 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -317,7 +317,7 @@ static int __init surface_gpe_init(void)
 		goto err_alloc;
 	}
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	status = platform_device_add(pdev);
 	if (status)

-- 
2.47.3

