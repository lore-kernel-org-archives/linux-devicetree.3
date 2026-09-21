Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BFB50B8B3
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017719; cv=none; b=JnCijt5fA8cWA7mqvVPuK4aBKqXDvub2pZ10OIfOSpx9vjyjJipbZ380N7oWnZX+wTVZjv9nRfxIN2g7D+BEelD2HAIi5/IUGUcUj5pHwsc5mjmhkRXWtamgr0Ubj/20UoQ5WZ20t1loaUjfE6fe1g05rJ6cAAkJgP316pGsM/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017719; c=relaxed/simple;
	bh=3zPDkuCDmQ38oUL9/eF9wJT7+qJydWJzTsR5SSVPT00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bzcmwdc8DMGSFo6N6gWlP5NoQml9ykC07SWwJAVWyZt6z6RheOq+6KRO4TykLinL7k52xxXL2UCZQBa+zmHFYPOhlfQEAPV8ROOWIZERhC5y/2umt50tx4dDv/aalk/18xgjaaf603BaLwh1BhbU87wmqMBW6FCGpdZiO8zgUhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTb35840; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rl4NPf1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTb35840";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rl4NPf1B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LG77O4351688
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=; b=fTb35840f89+kg4e
	OC1/lIA6e28VpD5gcyCFeXWPMSky34I0fZAaRYZrKjpTWiDr65wucgyuXP+ZibbW
	wQ3DpcptFE9ZLpN/xS3xU/2JmzbvDn9FU8WqeVPqFmKL79k6y/d/bwxRLbPEzqxS
	YphUu7qQaSdr+/kk8ml/iC2A931Zrzt+xuIWxikuTgHMAE8Tq/9BnjZYyjXxXxZp
	I0X9wRXKx0vvnY0pYmlCMChU4PjuEy8lOVnToQv67b4uXYa/hwJfHQa7n/aktEFv
	QKItee4xpjDXFUaFbGvMsi/AKLvEUMuJPwDW+3HNYlfZBFlMJD2r2eKqaq9ztaPp
	1VpIfQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tsgrpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:08:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso6017658a91.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017716; x=1790622516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=Rl4NPf1Bll78rWPV28VEtvxHsX/aXCLQ5SPaPGf4bwhGLSrwi/yi1PtcLS3JqtFexf
         KOkR++EvPd+Vbuko15rI1xzgNBtJ7efcr3mpP+gX272AxgZwVvSFZe6J2sMZzjzzVkNp
         awObjJyoI9pzSuTBdbtgX6PBV+OBJUmKPRsv7o3R6VNa7vAdtkIj+v+OOfEnv7Kn1Qpi
         w6uiolZaw08OYj6rEP7DPncU4e5XJUCppBQFU/pvcOQceGy8WVuyUa/SqG5DmZ8Q+m/I
         8sMK+BUZrIZGa8yUr6O/YSiOv67VYq5d3Uv5hoKpHSfAkaAdoJKKjF4Gbjb/oprO7wKN
         /Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017716; x=1790622516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=abSPZh18MD7OK2+7ekUI7yB7eyatKZHFc7neBTDLUacmwUtjG+RJhti5+SSQjCAqg/
         zcmxT+gu3n9+AGiASTANADXPnZHlRqJHhMChPY8rjQl0xQs089U6t6rPKKCQdCKMukYR
         BRiGXgIDruevv5/UBf4iOoe5elxQdzvXLb309KVMgenRO9KXiUpKg/Fbb/s2AclGkR8M
         oYNg6j5hUaz8OFynzLgc7DpaNnydTTVW+8nNY3320taHR0yIH+td5GBbebLgtXOmSLvK
         6pimV46OecLltcx2Hpy/R2M4PAIIObaQllYw6JPT67oKE6IoG/adx4oiOY3wEYYugD8t
         MDCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG7l2fS0w6jwXWN9EJQUNcwZiylPII+YwG8fZjuqnvFZfMPuGXJkU1wXxhQ/kbZnC15gt7ZtcDEvbh@vger.kernel.org
X-Gm-Message-State: AFuF++nvO+4es99ogPiUY6ETkHjwTzTOoUXZV91oH5U6hHlSEiI3mlBK
	BpQ/X8WZfxlldJeQL7O3dzFDq7/Ajrg2GNOVVW8Mcd3gdHg0MvqFoilxG7lZ2+IZspf55UqbKah
	DSOMK8UE+Sp48NHvbaRBY3R2zon1fXBYtguaz1gfbT4VLVITv4oj6aWzfDWsL4AYx
X-Gm-Gg: AYBFou2IDcTzE8gyrEaU5oYdvoyBs/DDQREganZ2cAljCrCsONIJv/v89TPqth19Yr4
	gY88XnnXC/ngLQ/QnuWiT2Rv+wLcUVAOG0nOW8+J5dMjcmAUuQuRw30it4Lf39qNgbiihdblUc6
	qBVgF6hBXHUWN7l6ImKpxlKk6VrO3+FQWLvHwErLePJExRM7iFBBO8E9HG9/aBmtlfTJNNi0NYq
	vHapoDcOHyY4R9zz5Uzn25OZPfWpzaJKME1HlK9frNJHA/UTZgRVsH42XzWcVWE8apvgB5+O4CT
	TLhq8+LaLb3BNmQs4OEXhDfVpB64cqArjUhNGxS9lKbaufiOBZKpFJMg3YiQBukwY4BrfXoT13z
	QNWdjgVejJAtQu/uMau92JoPNrU6v
X-Received: by 2002:a17:90b:4d91:b0:39e:6c69:34db with SMTP id 98e67ed59e1d1-39e6c6936e9mr10092011a91.63.1790017716171;
        Mon, 21 Sep 2026 12:08:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4d91:b0:39e:6c69:34db with SMTP id 98e67ed59e1d1-39e6c6936e9mr10091983a91.63.1790017715589;
        Mon, 21 Sep 2026 12:08:35 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:35 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:38:09 +0530
Subject: [PATCH v5 1/4] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v5-1-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: MC8yf9Fe6walnUATi-rmwSCGZfSrPef9
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab180b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX6huWwPTGcteb
 PWr1cwfGB0NnXBMY2/8tF96rx21wGh8ZHb/SNHYDtlZz6aWkpbvz/tEH4qEb9Nj/rmKyhIk8m2F
 7xnkzUEFneEkqcQvIezEUUkNLOW7OB4=
X-Proofpoint-GUID: MC8yf9Fe6walnUATi-rmwSCGZfSrPef9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfXyZX+Km8NGZMh
 vvZBC0xwB6+0dIjH3vROwpHQK1Vyqwmh59P4bOuksKZJylXBmeIER0CnwpIGhT8XmuAYwow893j
 EYCwMDR5bEYD2bLKbeZOXwwM9g6ofm9ECG71gsVY4C/yfEtoSnNvdNL8RxXPDdocU6p8ubzi/Nb
 gQx4jw4Y+cfqwnhg/de9F2USHW0Up7zYVeRrfHi7Il1VYQiOtojHRBfsaJShrFXSDYal/Nk0WtL
 loAHWR+Y8UseIp0AiXoY4fFO8vSsswQHEc7hk5NNCh1s0L713ywPAN1MW4NRA58vxs6bQzkQwn+
 oS7nNmJwCVC0mWVzJZHFIJHDt2rfFU/8bOFalOW1E1vYGuvil3fHO7M1B1SVIUlvSlCiQn9Qb3T
 Wk2Q6q/ATzdZe6Hkfsce6Cexrosa3VmyXmw5dLNM5Dnjx0gMgQjOuBbE120lKPvyu6OhSdN3FBo
 FR5ps/U6uC2yRBY6+7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210279

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

