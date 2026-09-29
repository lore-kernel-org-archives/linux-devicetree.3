Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572404F0550
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717726; cv=none; b=cU6lmEFsJHPCnmx0XpOwdlT4jGWj/NfRXjpgGHmw81ppJw8n1K0fKRK4P+0VPy+5UODUALqoKA+TpwqHOulSC5I4tBbJ+u0ZlDup6Kihi3esl3rptBjiPbii5MvjZ2ESfHWDu0VuPmylJZEu/1Z4fHyKx7KWbpFLCU2shPr5bTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717726; c=relaxed/simple;
	bh=CPcxz2/VOvWAWtViNoiWgwxMugTpbWTs7rbDXCSIDRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VCzwvCIs6gSezuM+h80i5nkRG6kPsvdxN7vcvEUBNHlKEHUJWPP+xXt3HuNbSbOhcC/Q+XL5bC05HsOEc7+50F3Qv31qFcaUCSXJS4VDY5M3+ggd3jCoAhKDFNclQbIR1qgMjSS6dxM7oQPqh3qq9C20Gf8tK3kCiYT5Lmnc76Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbbI+5pU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyA7T/pH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbbI+5pU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyA7T/pH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TJF1BE1649625
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5t8ikYnzF7L
	NMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=; b=EbbI+5pUuEYeEWFzQkLfdOqBb9r
	57jd+IWs2QjkTmw89kSwc+aGvBUmg63mI3/nUsicr7xUzrn30xBOhegxH5CaPcRJ
	keirJkLIsYhl5B9OEOMVTKBSPnp0LtKWbGwyKaL5XY4ybUE5JjFkZjRaXE9zagrX
	TP55GFzrKmNxfrg232QezIFFBHybpYij3zv4pz5eLwqNAhMGQLErXH+WD4QOS6mU
	+0gQC0JLBH4ae6cNYjhjyXL6LJ1lcy6nr+J1Ug6BA3JGazLcDqD2D+eUJhoP875A
	2LRSgkblbFgPW4xA5vTwc0+1awhx3NOC0xa8XFTGdGyUZcMABBDLgLglL5w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et29xfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-143826c4a13so3814680c88.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717722; x=1791322522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=DyA7T/pHueczU4xlfV2Vw9tU7JcdgaiCn069od89nebJEtC9V2uGUEhdpCnJLWnEup
         d0DkP3XgNEKFPLjAqC4I+S+ad4rl92R8xJqFCk8ehqTnP5TC687OVM0wtwjACS/r5gZj
         0OqkqzL4aS4XXM6D9YFb4qe8jQokEJAd+trENttL6jeAkW+WjmUNG3WS0XpsjedV/F0t
         QP5wRH5EXXnhVCnmA9ZQTkAOSU08JdKcyzWEZsLtSplGwvwW6KNpgjVm5i6+OUhMGUnn
         /jdncHECl783OWZEsbG05pp9tkXaHV+5/i0Cjyumakq4e1inf+D5mYNr9OGF0mBK0t4f
         LFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717722; x=1791322522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=fr85/wl4Nt0ZpRIIHLnvZDdIqAZYPzdGurRoiP8NB8QhhzwMRtEwp0Yp3Fw9qvr/vo
         7yVE7lZSJ1A+X+WPOSDBHoHEcoelvAbwffEutw/gDwmXglir2ohdTIqPlh1ctMhSdlM6
         UXQfPxgZ1cAO4j2+AXL/bdf5/E04IuXZ1WGZhDaZqL0Li2vid7ZI3GRgGDnApN+eFqQ5
         OuaE8HCxIsCEPui7Xj3iyRILkZYDuv8hx5whyFr0Uthi46wi/9WRVU6ilsp9SEhYV1iX
         d8sbVryVIh3UNyllhsiWXtHG1TI5mOtoXJgw9G8IqMsaCadgD5UvHYuZLVhs2TmD3Dwy
         0NLA==
X-Forwarded-Encrypted: i=1; AKwUvBy1qbtH5zxr0/hZHpg8LkFe3n4O6VdYmNagr5XQpcc4HWddup62pqaxdkmwPN0ekicrQcxuVzQQfWKb@vger.kernel.org
X-Gm-Message-State: AFuF++nU3rzIZbo4uuHgi9kCJd5yqUVPIh+UIyzSr9R0OGMLbJwTh7Gy
	iHgMoIAdajFI6TnDsPzkSSmh/L978j6IjWeNK0FdL+bf/dY0Oy263Hct3worTotEaAxxpamVn4f
	OeNDKY9nV1d7vGDUs/gdyW4EL90frcP64+h2r+C8CIzNLZiYQXLPJzkT+pL3JtPnR
X-Gm-Gg: AYBFou3B7oY/Vjy+KpBbeWyXJU1XbFMUX/N7lU9mjxpsUjowwP0KY1k1/NN6zA4mVEb
	faUilhlSWaVfmxuvM4SPOuvgNqh5ei43tqH+CM/TymIm9rsvsIe0FLuwVw8IYNkjyDyXv1hR248
	G8DfTMKBVCQ9ql6SoLNg4//mpGOGxGUm/AyRdhsEnyedn3f2Rb2gsyO3d5yX2az8Q6B3ueYApsp
	2XDYQKytmISPdyvoHqSIb5U7Msr/b6ybLSK66Kt22+Q7NNrE6r5s5u1WmeZMtOnfjA7W67DivSc
	zVv9/RapLSkgSHHr9yDX5eUVIB86pRi1JcJNWJwyj+7RK983Bb5kev1AXMfjIsxxkWFn4lN4gGu
	aV5kiBwb1R5FzeVUhdobk0Y33xS2JYqGrUxM1eWl96G88n6QVFV60
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576247c88.38.1790717722397;
        Tue, 29 Sep 2026 14:35:22 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576206c88.38.1790717721869;
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Tue, 29 Sep 2026 14:35:10 -0700
Message-Id: <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cbUM0zuIUgbwJgNeWiwCnZ8AU6Q0am8-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX+G9b+pEw21nA
 wP8XIloUtVbGE3W9L7Nzjs+edIhgtywXdn96hnboeDZbmiF8prxno8/TCfkexX8w3zyHFNJM0q1
 uI0JkYSVX9btQa4v4qXFG2LaVn/n/VidCngWFWAsKko0Yps7LEGkFDrYwk/NHCr/VdXY5yUlMx2
 Dbi+3/fuQ1UDYNd/fm0iZEd5HSJTELJm5+4PiNHwKBUbas3Gtu90otEj0GMsqV4v2G83Hv83MOH
 43JgjsNhk2DOHm9XrWW934YwtiJnZKWk8B6zUjm9gzVE2Sk2rtGfuIAvmDwHSGXjWRxtrHpY7Xp
 Cq7cmz90pBB1er4mgt9PmoutagTiuYhMbN6ajJ2x6wT44rpkkidFyMO1Mdz+SSXktWTTg7SxN/P
 5Bpr7ScP5iJSIS7GIog8rGFMkUXMctuuYP89HexrdaM8ndIR0Ap1r10sr6jcB+1gd42ZLTMTySO
 Ko3Auh9Kkw8iQt+i+sA==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abc2f1b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: cbUM0zuIUgbwJgNeWiwCnZ8AU6Q0am8-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX00WBW/c8uabS
 e5SY5k7GgYxgiiC3ihCezZfISjc90OAgJMykJRySSTq1/EJPCWR6LStBWurthznSUXNOTFGUTCK
 X2QsK69Da9AGrevutMvnBF4OdFDhLh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 48e474bdf818..e227d05cfecd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

