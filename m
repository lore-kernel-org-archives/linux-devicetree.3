Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936623E0C67
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138398; cv=none; b=FVnvDDbTahmIvdn+WD2mGoHIzJCfUCIaH6nNgdrzJzFNbNuih4puiPVeJsECXdT9EHbmYGfw5kqAPXd9kh73jmEg5P04MvWT41zqCc2zBKIkHsR3kXS6cybBkpPL+OBHW5NCUP329jKWeHx/+Svcq1RVsyEwp5yalkhxQ8TR7FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138398; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ponBnSa+IN5Us7kv8OqcW3FdezYr+gDoZwl7LYllWQaBbZKhUHrdQEM5cEDqNzk4KX0sb8y3dKxT1iquZ7NOwnvvy2M7e6/vkXFARX6TLV8UutMY7zh/DaxXvvjMTmEn8wRju2XFfE+sOuOY+HvaHN4UvTQTBurzEHiD5L+qdII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z40wigdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggzW1kXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z40wigdI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggzW1kXA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7RdNP2769491
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=Z40wigdIT3sUyAvTSzE8owg18o0
	SayNxRNdUkeufjNfQY2L2PBPA2HKSbzokl/gjTl40VEfx4HIxfLXyZMT76fGYO5p
	a3Bqf/s+3tqqP84+ec1XLgDM7X/3AAnKTaOeTrNgQjNgKy0bbuO0XrSJVGh39Eud
	Gpl3X1XRdlkuqlLrvmoTixpYM66yYHlahu6MrUR55ngHe7S6J0D7RZV3S21hotjJ
	YnbXKUGJTNFZcNrhuEmPyhuyQUGe31oXOtVMFhJOVA2ffToi976XFTTC4LAUqVfM
	0Jm6Q0gcvmLzaH+IBwEtLDKkRN2jcCF1/pvp5kApr0zQpLgR2YvbiLtcwzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2asg7k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so3971238b3a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138396; x=1785743196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=ggzW1kXAQcwacdZ9ZCpL46RUzM9UQJZheGsCEog2Tl+oRzpzp0Gs5Egs1eR874REDd
         Y80Y1AvjYu7Gju6slmQ64CgUdUhSJLJKuJC+iHDtiJ2B2yAwXUwsA7kzSOmIxNUezSI/
         QtO0+5PIfQvg39VvaCdV3q/2+kGJ4LqfC4FntRX8FAdZA3PxQ1A+tH8IyMde4vCAiD77
         kpkmHQ76Qudqf4Bgvjtp7xeqatlPNGopZlTPTzgk3P/wE3tw7duwRzQS7LmNTZNNbHOc
         U+b+dxy2SbbGhmRyiyWHCxNGzEcmNYEj2/HA90y5Ky0qsuFwZxC3A/lGkKYuLfnea7VD
         qrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138396; x=1785743196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=lQb57qVui84zqM7vrEMCqkRD7MikIsIlOrg0xuUywE2Py7yp7NqMFs17PM4VBCqIK8
         5mk4gr5wGOIUY/WiDgkxekwGs3CG0U6Or40Nnaj2LFQya3cDgMV8IeKBudOl/xMJ5QPU
         AM0FZXMZaYE4pJapZ4EqTiutZMWON0bQnuU5rMD3ngqxyJUPFNJ2vofR2z7uqkaemuzS
         7FzkbKje5b+eoG9tpQ3jPCLXZszPwd3BWwaWMcRe6ft8bLZ+WtAB0kgOz0lg+pMd+0/g
         pn7nKlErZlx0YYMNXRnxdik7JDpHlmI3/Qq3HT+Fg/BXG6N9Ooit2S6vhRZLyKN5YZvs
         YJkg==
X-Forwarded-Encrypted: i=1; AHgh+RpFjIcnNeXEoWXK40F6FXnyeHPBJWn3dL+JKgf1iOYxBmOaRwLjzLz8XgrOCx4xG4lWnUubGNU+EPsR@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRi8fvdZ44KxbzEIaUjfDNwaFC/VdkE+Yl8h+0dVREUWYiPLr
	9la4SoekVr/zLfGCO/2wxsnmw017oq8JKh6uKuDh7SdMnpVe8DpNKjto4rWl4OS5fY087W26V3o
	Ua4zMpBfqCS9Wo6c/zynXx4fNftcTMCpuqLgh1cM12nEtQspRfZCs1ZBy9WLWOnTe
X-Gm-Gg: AR+sD13LE/yQiauTzAzX+Qq+gQl7XlHUfGJ0TNxGxxCSui1TrtMnVfXsZTv4pnoqJx1
	wKbLeWuUzt4Wr+tPpLHuOysyHSevilknnI8xXQD6NUucBz3AvkDPRyBs2GyKWdBZI/ehybf2W1y
	Z0zrerHomFrtIHZ9F45CYdbP8LNqjlVaoN3taXmiJVbW2SywvF83k0ECam/k8dUfKbQQEcPEk4u
	QGq0GX+WCo7QVdMs2oSy8C+9JB6d40dmzIg9GB6MZgqTMGLj5nQFWnc8hTW8VdCPXGyYK1/mQbc
	PpfxEfSU/1a7Cl3KOZrOFZhSP+6xG3QNaD+sQ3pwFv30CP1Fe9vVeuYRSrTKs2BXMFs4Nf3Aili
	keapmLdbTW/HeoCBvYksajitiFhG7BMTViweNJ84rLz2r/CtssoGTIeORbm5b
X-Received: by 2002:a05:6a00:17a8:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e593ff371mr5978613b3a.14.1785138396267;
        Mon, 27 Jul 2026 00:46:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a8:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e593ff371mr5978597b3a.14.1785138395810;
        Mon, 27 Jul 2026 00:46:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Mon, 27 Jul 2026 15:46:19 +0800
Message-ID: <20260727074621.561661-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfXxvkEcdr3NKJa
 aZiWM8qy1AK6YOxGylA56DW+8xAeJLHIamo2EFa082olNf42TOCqlF2lHq6/eqhmmBFvV0h9seA
 Is2w+AbZgJgwly7OpcRqm+6IzHSRAJZ0I97Z5P2WTDK1ynrHKio21MwWT2gpKFn9qBKctv59lgG
 tK3qoFMNhZovY/90iWbEcp4UBNEK8SdGCTPYCGVSMah2QMjW1Gn4U1GLkfVzxsf9Q3v6Ma9UAyC
 NSymW+cHWp6OtzOk8+2SKhneRD1S6QGR4UJm9RRmh1t9xs+sJye/pK7dZdIB5jI36xCR6KuTkmq
 JpaG8QUGEbfzSsbV4oeDT2WHE7svrnQ9hAm480E9s/aJnpL0Qk58+AL8MfYlM7EmEm9m5lJBsOB
 DJ/kLrRuu98Kwe3Ws7Yk1xcIGMzWL+cIPuNew/DBFXX9L7vfHEo00YDt23BmppCUkU15By9TY95
 dn+LQzx4tWWihuttTgA==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a670cdc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX3dGyvuSAnsCh
 wymnxIiVCLBN5E2lJ9Z5xCrKZbks8wkVYNceXQK6fgHUwx8W5n/F5+6fhhnkX1baFqj8wLjqrot
 8x5aiyXGKOxgLfWozhzKaT79eEqv8/8=
X-Proofpoint-ORIG-GUID: y5J75NoXbnmJONIOB_kwSrU27MGvc6fo
X-Proofpoint-GUID: y5J75NoXbnmJONIOB_kwSrU27MGvc6fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270076

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

