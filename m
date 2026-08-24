Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03EA42252E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572571; cv=none; b=d/dO3Hqg5BSSAuEOrCIfaRrruTY4Pc6CgbQNQkyBJeCWqKaCIFPdb12BTCsHNsnGg7qQmZyFmfExh5MQWDY5VxQoJVf0VjOAsSLPEGWZQy5N1gjSdOqMaESKGZ35Y4C/wiCxh52NCxcoccxEfnYDMpqcam9G4EBdJ4KF5V+0L+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572571; c=relaxed/simple;
	bh=7qPJx0L9ZJ8IejD/1N0QGo/uon+hk6wPWX6yn1joseg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/4V4PPaZizVH1zcRd06ekM9BGboqNDwIxZDXiGdEwFGNZYUCnm4k+ZiVtIa6BaLX1fd0Y/dqBBtYLKwX9du7cv6AcsL6Y5JY0GSg1dIVfzOQFH4PlCnBKKrUu9JMmkgRRwbRooetPQmqT5vrBtjH1QhyDmKTUw+cH25phOP3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQrGtPkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwBiSnMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQrGtPkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwBiSnMK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeIk2372617
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=; b=XQrGtPkLyb/1B/ej
	Lnj6mIFbSH7kDy5BenjWDn0eVEM3YAy5zfXQUDYIgy6Dlall59nNyHg0sC2GN7R0
	SIGZMIBdzqHdp/MHWBNfMcscar2qngmaxcYmj436NCMIvbIUGxE4qLaiAXYGks7H
	MGt2YzUOdLW942Rc3hYhzzxR7f62AYs0YA5+FukTirDGSF9PRBOmKE9hWBUysEFa
	vcF2jPn6VH1tGcow7oVG4qs5taG8LwvLJ5H8Ngk8JF/+R9ToZObnASlHgPa1TijF
	BlbyexpIjVZOH2gORca5pkRY3h38JUTlTJOgeb2a7/ky1GDNiC3tk5rgZET1gOkq
	EOYlBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshemx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so64378071cf.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572568; x=1788177368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=;
        b=UwBiSnMKl8ife00fXV1B9rfAQMmTr5tGJqxEVOc7nYE5wzrLiIa0S0YHTPsvvRf1kN
         zOgy5VHmn1y68lgRgzFkU3u+v/W32rjFb5R2lEHIbMAEsmxDcfdeUA69AI0s8tMwqg07
         zYwckEkW6a6pU5o31Z/cggRU2YZZKWVpftUV62pzp8Y4rqL7RYgB0JbJR9MGefTuMx1G
         xKpDWfx8+GsWEkexJwTAUScv5bNgKlgtLbM8rpPAoGw9X0FOx4yaUG78ogY3F4xLwAnu
         r1arW4VNUJTTWExiivABo+dPAgEmzmaHZ2BD+THDW6rXq/kVOLWTpajiqaeFW/XdaVqc
         s1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572568; x=1788177368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=;
        b=DymShJUjwJbuJfXcAAx4ioW+BQMjCfv97MCZu1lQCkgjcSN0G2ElE84aJQcVlel+s+
         +gThRIFW1cGqEmFBCJs+m1ziQWvs7opTO/NYUWXCkevMrluwA2gQyyZdYoX0v5NvBlsK
         0wwZ/zIcEeIRSWAhdmyId7VQU5O3JKFsPChn8VRkTBg/37U+Vyh9s2mhELfoN7Ey6GSu
         UcJNoFJX4agckRsu/dpmlmEvxqR4ZD7Yd4fy5KVVvxfUrbRfbNoNmeMOIRf0QZVYDIYU
         fYhsDzhM1y1nq/BXYeb7+E68bfWWzyMfnGbXf/QPDIBf9FkYyRMayk9hEYAMXX98X13O
         hJDA==
X-Forwarded-Encrypted: i=1; AHgh+RqZG9n3ODJusDR+vVFinOCOIhrcUC//bAHnnuh++wsgfPBDgEaxNYXvBZJolXH/86Aw/psf/vcv/dk/@vger.kernel.org
X-Gm-Message-State: AFuF++nnhPa05/fzxsDspqMXzY8V/CWyNgfzWHL7OdrLKdrnq3/OB30Z
	F9U9sqyX6Eqt6xO7GG/+kOSdV1PYSOOaaH5szZnDkIdpWJrolSKXz0u1vJmfA52gzuAtSiQC1HQ
	48iXSWo+pt2VnMjQK9XsG66mIym7EFjK5Dk13HcLzoQw8FCi5CQ1UgWxxbwFP8JVR
X-Gm-Gg: AR+sD10rA3qS6Rz3GcFB7tEDdf6OlOPTDDbvIBrQHm8YOq8zl3OzJeGg+mIieZ3w53w
	gGyqIjQtTJuTeDSjoIa8KFq6kUe04otr2KFlC58e7GkE8s6eT825eywi38QE99FEOQtCYAqtAbB
	E8J5noShAz6KyQpXKHe5H8jYrUu7NB+s6z9v0wPyRH9psG2WhwxxYOGMLj05GllaBJvE6adKNy1
	d/9irJGLK2n2OlSg+jy5bDnHwF1nn08/LreRlQZ/TBdHnOfASCvugd/IDDe8rXuvra/FIUJS6JQ
	3VVA53CVlnfnb2DEiub/Ffx5UZ3TTuYgk5zRn4V87ui1ScKcBeKLyzhWc9B7gw8Ta4WNMb3b3yI
	ToGhmt9tr
X-Received: by 2002:a05:622a:989:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52df59b1033mr256263791cf.31.1787572568240;
        Mon, 24 Aug 2026 04:56:08 -0700 (PDT)
X-Received: by 2002:a05:622a:989:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52df59b1033mr256262991cf.31.1787572567689;
        Mon, 24 Aug 2026 04:56:07 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:15 +0300
Subject: [PATCH v3 28/47] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-28-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7qPJx0L9ZJ8IejD/1N0QGo/uon+hk6wPWX6yn1joseg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDwVvYy6gwuqmzwEKypVSiqIQtO4/Fnxqg5X
 pEg60ZT5waJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww8AAKCRAbX0TJAJUV
 VqFID/4uBw7fl54V1epuuCQ9n1YQ2zOuUSnHrjfLz95NrG4/wO477aOIY0zpZ2BcwGnpk2dGe46
 kRoHi1/2hT9i+RhrxuEK7/dd07i1Gd3eTGbOmKn7TEljpOr9mDJlUfHmLkUSAB/xLbffcrAMiKV
 +ZK2ryyYRgbpu3XxDLq+jYXD5iH6Be0NVzo5LLMZTsd53/qPZ8bk2JI7OS9qkw2vOYnh0eTHoCj
 JzecYkekztBwurrKYh1IuFDSwBTqy5x0EbLHmPdukrqLbhTfZciRZLxV70Rf8rXdQ0hXR/CBZJE
 ASOy8ih2cYgSWfgcJzPnRlBfOHG3hbFq0Eksj6WdNbCuJRwoNv2EQO+qVP/w+Jtv7xW7Yoosc4t
 4RLbqfBC7vG9A0gSLOsteBNjJ5UWiIFx9RQw9a4WAgkQG6Ip5iFeJY0vH7lQQWdRcZWPmpM2MPX
 DuPGutKU3dOWnljr5U/exGbpZgxrosZRhnZnbt/+GfbmuZhA4ErY08s+lraAwllXqc4XKcK63AC
 dbaT/+ovTZYYH517B8gXmTQY1/WeJUCs8Fb+N5ECd5t7Rge5yQrW5aGH5QVLz4B7sCOpon3YxCq
 yprJJ/8MuVI7lXbX39Z9DYmhMmvAy6SeaadeOCOT9klW7JbpiSOV6GNXWA2+Bb43wUU+kK5h22W
 frtd/+EYI+N7ekg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: pwCvSy9feBvJ5oBGZHEl1S6FxBxFapVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXySWKKLMHnuKB
 y+glWsbGtIYoGHgn1D3d/F9RoaCheMuhUxTamFCs60zpptQ1uI8gkFd5MIpHYRf36sy9P2vETJ8
 Da+Z+e1bYgjKb3gDlj3PJ4nPp9C6A+Dqapj6IuL+PgF9vzxruvMYvJyRs1LLyT5uBZLIQGHwArt
 hd49dLJmiBUH67PY6AZ5qmdIudhYKv4XhTfRhIc9R+ue6lv64xu7ib7eVmXzUQStUQt/Pp437R6
 Fs2rGiMKBRCmjpZv8A96wA56rBF+dMxs+D589++OuBwzSJ2fIp4gUoGwE4PGK4F2g9faDmWc0gs
 TzBP1E7kt6GWvRjR2MGvGDHitrskYEyLVsXumdqzsOkWTXd3+gycJj4sis5DeJGV7wVZm10Q0o0
 vNCmLnTMKk/qysqsQqkMbB58fWOZCmS6CV/bVLo3BInnvvaBumcXf4t2xNVJ7ojGmN6m1ZQ6u35
 WVNPWS08JNHYtaltDlg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c3158 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pwCvSy9feBvJ5oBGZHEl1S6FxBxFapVJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX5t/VJrFwKXvf
 O3SdDj7Wys1/70WmzjPtAxT/90J7OQKBmukL4Owbkbhr0DNAWtxrXevVrOvz7mUWpkE81h/fx5P
 WMBD3sgnvCQ3hvn13ow9JlmwPIfSzdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..427ae9cf28c1 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3326,6 +3326,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.resets = gcc_sm8550_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
 };
 

-- 
2.54.0

