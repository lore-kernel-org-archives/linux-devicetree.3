Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971B471CF8
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250057; cv=none; b=BWCgl4I7a2FtNO+GBwKQz28HYAwBrmw6Spl+XSc09tuyBN2z47MHWFcwYy05wp5Is/6NUs+sjJ6uHC/J1Xqa+qLq4vBouqbJES3eJRE71KtyjUFkNDLlHG3cXtHjX2Q1vv3N4MVCjDga9O5xP0qau8bmNq1Tek5r/53biesEPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250057; c=relaxed/simple;
	bh=08WdFK8UjNwaxYA+Mjac90vOPfMlyu3PjX7RmA7bpP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTYpIiIUVGlbuRPqzj49rN/uVSnTyf16dl+B2PfwC2bJOsiyFr+BBzst4RQ6D4xW3u9j3KLf+SSMe1FKU4YUqY5yZF+fgdevfbNMKTbUqhJNFcQb24G6Cv61WboVdq8Yanvg8kqD0Hee/sXmF/QpQVoNtUqadn6+q3cjAynuxeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYcbl1ly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkQDFTuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYcbl1ly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkQDFTuE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Idq1335390
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hObe6IJRPL50bbdsgxF23orx/eRcm8Si+sfd1CaAVg=; b=YYcbl1lyVM4NBjzi
	abZ4kGLeYhIEVadjsDmGHg+WHzaDS9T8FqXQJ6MEreIFpewL1PxvD7/i64Y5471G
	Jz2gw2pgQxoKq8Mk1ibig/PCafR3J3BlbeIrVMLtW9IJkUgNgpYJqpvtbcOpSXp6
	oWv1XDXeJA/338wwtHGtDk+eJPrwPwjj5FwKgL4NmEfrpkjl0qUFUc44npdgpKom
	xWRU8qBbxRkFDLONOeF8WtcVg1cu2JoJ+A2xWbwQWHgmVpvJrYobvHjGiuZecwAV
	m2GkcHDZEcbgkcyNArW4V9Ey8jDvdKQiWPooniiiDLK7IuakIeoG/97REbP7LI63
	uusNWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx21dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390e7e4c5eso114571885a.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250053; x=1788854853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hObe6IJRPL50bbdsgxF23orx/eRcm8Si+sfd1CaAVg=;
        b=dkQDFTuEeR7IS25ZxMhC1gbJe8yhP1Yvtfs/PuUinqdtpw+vtrrR3vfiR9Ib/+up5a
         d0w0JvcL/3lxUNcN+HswJ+Zct0aeQnVaV1XCPCzU6jYff59I4LubTEr2dxHz33nOZ3V9
         S11/DxfAIMkk04E1ogIO7vzlsq8JuC8fkwJSCRk8Ini3TtTOor66F9CFi44/EMfVNUxa
         lgyTJgt9bTAnNa9zBaS+250p47JCk5tGGbAgjQhGgZ9vUjceNXeToQmzNtxJbClzZvZh
         fYPsuEOzzpp3lJNs0UvKpPdn4yxBK9SHhDalXvSiGQahmvDDHzzSi2AKhHBBxfGjGqfT
         UX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250053; x=1788854853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hObe6IJRPL50bbdsgxF23orx/eRcm8Si+sfd1CaAVg=;
        b=HyXG6BT0A00bmF3EXv7ECTVF/QekPkbfziUL2WkiNbEnAz7TXVD38wYdmMboTvgCPn
         H9Eyy7yX5Zhfcl7SS1+4fYxIqFal8Z87qUfx6chZo17CzjhYXMlstzdnletD2aGVpy+h
         jZm3hrAcxGCp9P8pYJmGxvRc2wCQfHPiP9u2FM5aKxf4NeCZUTtSWGydBmyjfxEFigQG
         7i1D6qamywAVm2VXDSxsy1kcaxX2AVG8mW8l6lWK/7P+aJ3z8zSdTY3dve7nHZSw9QoR
         gj+JDl6fMez0VACgdaoP7dJQzCFW+illdZ2LIFP69QpyXOr/PLfevTU33HaTNnLnjRVV
         O7DA==
X-Forwarded-Encrypted: i=1; AHgh+RplYtgyUFZNA6NBgFKMAs5Tp4kBQ/l/kB+/MVFeW/nxbl+H6gusMFvyQr9Qc+GyjQq6AU92HKltU2ST@vger.kernel.org
X-Gm-Message-State: AFuF++nrs3xcfAB1CgIXBwYFfmswEfRkc/p3pRTYeS70JH6DCUJiB4Az
	w25hFd3eRP8/4Se5SfGohKC7QUTPQjRI1wjOqZDnIDZFx/Y9j50FRIApTFqIjywLPHDmfLn+HEG
	mBttpBSOAC7DkMrh4KptvpDARcmz3ucprxEEDjwarP5nXhFljaOAObPomn6fQtXiX
X-Gm-Gg: AR+sD13vgQD/x6Cgy8yYQOc3Hv218bDybYKQ6ZBEUtznVMm2xVJloDhu+wTztRvLhaL
	Z1Kxni6PtBgLiydEqYCNUJHBmez5gD2fqMymAXzTcZwr8aArHA3/W8MhzdpzdEDGL98ktIGMqie
	QspWe+Ptgu5yicQkEYN2UzHbLsd+rkkf9s4k50XyNOEmgKMsDDYoHrznUVYK2x/VQE9zpJxCr1u
	3H+/CjZoYo2XMhC7DTSWObfpIjqcYFLDwiNW71pca3FHm9YbDTxPWfiYSv2KrObbT9PUPtVOKgT
	J84egLiP3vFVTa2NZbFY84Jwqk/12NFQWLKgzyrizOdiv4nQQxDsQWYYN8YIxi94+tIKtIMWNNs
	zY+5lMeJR
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3313877985a.37.1788250052604;
        Tue, 01 Sep 2026 01:07:32 -0700 (PDT)
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3313871985a.37.1788250052016;
        Tue, 01 Sep 2026 01:07:32 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:06:59 +0300
Subject: [PATCH v2 02/16] arm64: dts: qcom: x1e001de-devkit: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-2-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=08WdFK8UjNwaxYA+Mjac90vOPfMlyu3PjX7RmA7bpP0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloesSkOJyRLq2NTXrr8Os8ygT26cpCUutkudg
 IP763jhZfiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrAAKCRAbX0TJAJUV
 VubeD/9liQOuSvAKBgq3ZkuJVfk1mWM3zFcEY8PLf+5CWI/k8bkxWqSNzkxhONVMqHENAbNQBWJ
 z5iKmotAcX7Od/I+vWg1zaVU/NTld3QAdGf9KawNMZW7BLAX7wLr5XPRp21TqAKs2xXx8K8HJx+
 WuJwbaptTQi86yYM+XAs7s+VOSt9avkXQnuKQ3pWURQswos2lPbXVb8L3jkPpL/lURE5Rws3t7c
 3ljg02SSYueL5moMBX8qZL/cM3ZIW3I1ZadneLDBcxRwwxoJJij1DIDp5qLorXl3Bl8ZlPzrVkZ
 StZYPXyI0F6ODJkyNMQG3ys7zwt4ZyFIB2wFmzC8jT7VnoZv42OVEycPe0/GFkTg+rCw6DPz8oV
 udgnCynrjnw7fHM/F217ct27JvYTLs4fJl+6WneA6STH0KJlPdJT5lr7R7HkaaCCtfTnwEn95Ru
 R3DZ6mASgdtO60PYq+4QUY7L1dpCN6gLb5fQ89VhUspMZHomHRIVSPOvBv1TBXzuIQhhk7YqMtO
 +mV70kd+YDRHZxvV5Ri5tLZfJfxmWnoouUnvhVKARArhfXgNJk6DjXFXZgV1z/aEA6yoRMv5ydM
 0VpnE6tkIc0uc2k/qeLJM2AqGt+bBglgLjYjwOswmH02pIP8dbOrODsiz3O4fOXKvF+Q5sOqk3x
 as1ZywBKRL/Zc/A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a9687c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX8i8GDMQtzEXs
 L+KcspDYBN3nd9+k1tzsL+Us0olWtN2S8kcHSuksEtdQx72nvnlsyNDp3r+LckyA9nDssWIez2V
 aU4NVxpyJ1EbIKA22SHnJ/UFIuUYOKk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX/cB7gptADjWx
 +RGbmIxlAOhWX9T6rRASedAx4gLnVrdRGv6O4SebJC0zOtY6JVz9NX0dKQv5aGqWkpc7aW5k5a8
 1X14vR7Y+OFUGuI8RVkVtbSff6h3LDRRD7pDbrEjLdjkPaCbUMrpyUFJENYg16D7wKOmYzPNVG7
 7sgL6Xv/EBdolg/HFELty4q3GIJstnwwJngSmZdKIemiqGLGTualr71/8dVkZ3xeWOqZIMYD69A
 ou+IHte8+CdV0Xxx+cchFa4g1UKjjZQ4/UdWOpAhKSDNXZSc97REZbJJRAgw32z7EzdyGpV1LrM
 7SWA3BYJmhvCZRMIrhMTOtHMGYvQyJcoYbzFq2TXkV1AYkVuY629oTg9MOeb/KPCkD8RMxgWOBh
 fs3lsa8sCHMLfbm9zrJG1A6bN6g5p3O+/SVJDGoT17VRIpT+DjYrXHWezY2fgGQGHZJhUpDCzPL
 x9r3a7wUyO5mYWg2WTA==
X-Proofpoint-GUID: BYopp5kalvTxcKyDevLYyU4_8J32eKE8
X-Proofpoint-ORIG-GUID: BYopp5kalvTxcKyDevLYyU4_8J32eKE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index be1a8ac8c699..3ba45a7884a2 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1194,7 +1194,8 @@ wcd_tx: codec@0,3 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
+	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";

-- 
2.54.0

