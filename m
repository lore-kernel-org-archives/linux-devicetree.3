Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24D4FB9C8
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739410; cv=none; b=bcFs76kpElYI0Sgu/U9OVFmkSG2dw8UDQ4RBK8E4JJSad5MBSST+GEoW1VWZuD1cg0QrHvtYmgkfraDJ6Z1hXu6GtBSBbJEjJ8zdPclcjb0yc9SnKkk7l3soYWyc9rEI9tq9RngNuw8ZJnclIqs2Zs6n66Km3PYDaMJsY3UFVwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739410; c=relaxed/simple;
	bh=3zPDkuCDmQ38oUL9/eF9wJT7+qJydWJzTsR5SSVPT00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlCXR7sXVGfdYzFFwHqCI7ce7nxz52q+pXV9gTSo3c9fMmLzc2hKsrXFpl1VtgdHY3yd6q+P97b508082MT5c8c0XR+hM6D29qiLdQ1ZF4QvNvw1ZOsuQO5Co5l9ylS/u4TpMwcn9fVgTmt+d9XBdEFdwPuZ6RAe+AAIeDRn/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgDK1/CH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4NkAV8k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgDK1/CH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4NkAV8k"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOgtj100724
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=; b=QgDK1/CHfX1G/gL4
	S2I6jAuWNMUTvi3gKzzUZBr2Cy4aLUUx8s1bpU537HyOiPV0E617cKVhDtOwTTNA
	ZogziqhCjhuF8+puWTskpneB+fTnPgcGCzQyN69JIWnto/HYxEjKX+2Jzgh6EEI3
	T1Phzl2wsx82cwa2mTehDk0ju1gnoP1s87f74Y0T1Y7kkmTBplDB81SczXkdot17
	H3wky8I2Bo8p95CDN4KgtiB+X9w/JmDAbtvNHnueU/dwD0M18TzXOmhSr8D9ZI3x
	kPdxZZ7+MT4lnP1z+qe+UOA9nj9+WUf8D/c7i/oMWzanNArFPsvzJSDbonwr75TI
	nyuccQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2kutxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso729850a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739407; x=1790344207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=b4NkAV8kis2ZYikazsxk3lIx6pMovHhGGjeJ0kVddugQjK845Cm20MIdjsm0oOMRKv
         ZaLVwTkcaJ3ZzsSojCfSa4vQXU9d86yg0F3iAl00tDTNZ/ROxpLCo5fDchjjAwvLrePz
         wjNwQoFKMIEKbY/MpWl53KvVQKdCnIlEzXPhLp8qcX1JGyE16TAwvex4nVFFCWYFG36h
         pM2hunhx/il9wZuzTU4U0TB0qkMW/6eIRqBuaaMQSgpgipC3KMwxQy7WKvX6lK7Apt5T
         aQbtnc8IbeCGSzQQP6g5/FXSFBnrjcTDdS5faAkj1pCP3Vlh3kossvg2OLhd0FS3iMGd
         4Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739407; x=1790344207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=kxMGoI/XtTQuC3jJGzUGupTNmoPEsM2Y11CyWYueZW6XGazYf1PjMj6v6LTdxp9vvs
         B8I9r0ls3wR53xfpakvYWiEJP1Oqpnhia45M4Z+T3sAilQ/l+R17PFwLehHS71QPaUuF
         lajtVU/N7VDnKl+NrsAaGUG1cZCsHEVbRkv4wgM9Xm4yrPYMdn9huaItLu8wR5KLhqf7
         sVgAi2dJm9bVo5Zv3BkjsaOryIzcCWQ+RDrbgccG8lwVgL3BB+mZQq+ysXGqJkCs2u1x
         D3gOijRh6ApAVuzwMbi8IWPiOhcRASc0TzLbaMtoOQTvmIl1AyqZJOKSz/LEqQwpVqbx
         /Deg==
X-Forwarded-Encrypted: i=1; AKwUvBxJbVrXODBGBKamDEf3zCxqclg7B5q9x+bMDNHjIAauPlRWdGQAQocMjfyiLwAkiSGrKBpJBwHG599G@vger.kernel.org
X-Gm-Message-State: AFuF++kPqREsgQ7vusEzQ+4CFECRZDEajiuR7zqxAfPXrIaqD6Y+xwjL
	JKpEWchsRxhfpsJJqfKp/PWvvTqGhN8ZtH4w4b2MvHf1yBhTAKTUIxc20dX4KTUbgcrUmEQSx0D
	/6ZsdX8jZmgYri6TB4BciYhdIzsdbg1/97NkqWCum22DSOhDWhmXZeAp8OOQ03KZJ
X-Gm-Gg: AYBFou2L0uVgjAR13iyogjx97zJlPSSXa2ATMvRnmGS1H2FBkV3EQ2i8PDeYCKiNxPj
	hb9bo37sWotyJgP/eKdHgOfjDCL88JQGgpRO8t4+utoKR5gfPGSjmzqVD0ZSg68rUS88CkSB7Ng
	CVO2Hp6jlyv0oUGCz4LKrmEBIIXZpOZ6xVHhiRxw7YZPDRbeuZH574i8Na7DL/Uqg3jugD8GHoe
	PtxgtD4c57D8Oe9G/8cD9PvXTf+v50WWR1PS8u9fKi/Pz4zQtcyqs9OJUNZgzAzZZnus+KD1ysT
	AFLTlvxMfoCCAHmHWbGcOc/ynZ46PmhXX2ZGNbZCetpB+DIM5DKxPCKnF1TNm1Wn4fmAms7h4gH
	cNaUAPHCtoNf2ZhDPYWmC+aHtlzM=
X-Received: by 2002:a05:6a21:1b81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd8c3d3acfmr6221632637.4.1789739406882;
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd8c3d3acfmr6221581637.4.1789739406436;
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e9fbesm1013934a12.32.2026.09.18.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:19:35 +0530
Subject: [PATCH v3 1/3] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-vmid-v3-v3-1-f1cbf47bf173@oss.qualcomm.com>
References: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
In-Reply-To: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohit Sharma <mohit.sharma@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX7HgwOP/Bgo3U
 O4glCxX3dKGL1Mhldd/uqpry8qOZL3KTOxQoMSo4NLrqEpJBdRFHdjfP4AxTjzz2y5zhtUxQN+S
 n1KZNktakfOW8mYVXOGpCN0GcXWMHslaX0o9EKV92G1O3byu7MGezAKibEcX+UiqP7Eo72C9I9U
 0i4W++BHEzI56FV/mdm0GZ64tpD3MhHcyaVHHdh5NCzQEMIzg1Xi1wrY+mDPkMhQ4t/xmZoJsc0
 D+OIRMtWe85G1OXst7x69TYPtlpP+DqNiPPuQg9QRE7Sdb2OvdPS/gVubyG0/LDxOWkbSonojOc
 pI9HNBNU4KPdYXrzhj5pXVRHU3pe8cBjvLS58iQr0rvg6QAJ44HfQYA3BYEP7wEPso8JSKLA0O8
 47jRiraMy8pfU9hLF/qkT+ZP2Sh3mrNqiMgPa2QO89f4WvPPuHwuLvwLIQVP8aFbHr8u10IBip4
 F7QKyFZTrbohGIPDTkg==
X-Proofpoint-GUID: elBhxbGt7twVCRdte3rARvpWgcsBpRaz
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad418f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX1FRCOfzn9E6f
 +sINxPeGkutTr+/Ped+ZxyFMLY1qf99CoO6kpL1WNHW22rMRkg/9NUxTNjjnfOE656nv9X4Wpak
 rAJiQ0eW6aqeuxRMQWD1sby85g5i0lU=
X-Proofpoint-ORIG-GUID: elBhxbGt7twVCRdte3rARvpWgcsBpRaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180196

The global g_apm pointer is set during apm_probe() but never cleared
in apm_remove(). After the driver is removed the devm-managed struct
q6apm is freed, leaving g_apm dangling. A subsequent call to
q6apm_is_adsp_ready() dereferences the freed pointer.

Clear g_apm in apm_remove() before the component is unregistered so
that q6apm_is_adsp_ready() returns false instead of triggering a
use-after-free.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 641d6d243229..12c6dfe4c58e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -894,6 +894,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	g_apm = NULL;
 	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }

-- 
2.34.1

