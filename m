Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF943385D9C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846131; cv=none; b=Mw7CcCncZN+RfKkZhNg5Q5is5WHjuFMlua01uhQHoLFbXlmL1wtJq9jbKG457AEP/99D4hy4YAyYGZZtbJUYDB0zOhxUlD5lXnXfqPZXocgW3jHvUy0zFKqAKnBWSfBYQF9tLTrP+TdpT6N2dkNW0vDeEXM24yILvNwymO71QJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846131; c=relaxed/simple;
	bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNtfYRzkAQv9r0ZY8vnyewzv76cW/MlSqyhJVugRvpb6a+qJBiqr41S5HJG8wvqQnh+4flrDJilC35vIQIEkgBwBvznDo8FRWfb5d0uXu+zD+YoyXbJ+7mKlGBMvO6eBDahzcgy3mId+UXuRk5MP9tKT6OLTOQFLNBa9ODLSdws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAAUl82q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PU7SXvOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAAUl82q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PU7SXvOz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CHN53546096
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=; b=dAAUl82qvTMLaRjz
	rHWWQg6Ohag6FUBaFyLIaHzlH7MWJmsVaWFZrvctlZMXhm7obqO1ntQN+md1mAc5
	lJuPhG1thi3ntgDRLe2+uragNwXEcbgOV7JbtQquDHpNmMP0lfZZSblOENs3IkUE
	30vij0xlQ+ErRopmnFTv8qeWwWscT9SOG/r2COlUy0cic3PXhdqD+G5Se7je4B8v
	vp/g0mvYQejLLz/ZoX/ADb5dnc/QSUAaIADPMo2qfHc4R/purUmU2ws4857lyF/5
	7rX9YGEwpslEAp/GImfBvmx6CfkrEJV+16G3Kw1AAVtoW4sB/a8J1gTlhWi3yD/4
	tmOlNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs2w8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:22:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso50932241cf.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846128; x=1786450928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=PU7SXvOz6gXZZct81Q9+VqeMUsWkDNrQEr+eWbcZZ0WeybxHcYTq8CCDGTCk1LTQNk
         qv8RuK0/QYC0zlMzU1RA7Hd5PgbOQFeXSXOwc0Sbn6Gji0yKBsyhN9ilJ1V5+2pTgEcF
         6iUezMVczTRD1xk0AHv0eJFVGbxtmCOZNfF2l/OC3i827V9whD4IkNr4uP7MszCPx8th
         OwhK6dX4fKlac+5aHHT5diAgrMqbFOmj3lN/hkq3wcsd0ebBKi/LPTvpNC+rM8sbPS0b
         dBLtjfwf/n/lppg+74DQkbh0RQnNA7xPEJhSY0rEArVIOjKseVcaR2hf0KRPN7bwpxE8
         W2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846128; x=1786450928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=EUgpIPmtlB+yH3R5dbQR/C4yzYQd9YCF2+l5mDP45kJl3Dw3tMMnCMaWgijGdlvs+T
         A1x1PiHQnhGWvw/9qjbd/PjATZ2/HNJWbR1oolq6RUiLaU4bO3OPvEFCFjpnLvDI/gHj
         kqUYc5bdIDDfPnB2seW7NEpDCIrY452TbiuoX7jYaCFymOPCskrT8uMLOvxdjaJxEFNm
         +ZPnFekeZRj+SKAXhqF1jJ6I8etIhyl4G9DUz+LK73zx1pme/S3OJZ4h2gvMfwZbdwQd
         avimLccdchdqatTHvL5cu6SnSePha5YGXjwbYX9YDUB4V0vuMWrlyqOcBwz55+e9o17I
         4KrA==
X-Forwarded-Encrypted: i=1; AHgh+RqzgbmXeyFm9VhUSQY+HTfiTk0Y5Uni0fGDDdrQ8IZlYRSCgfjbEGCB+O/kiCXVKvDWyvJfDESRqPDj@vger.kernel.org
X-Gm-Message-State: AOJu0YxEqc5LWWMXBA8UKjR61y4CJ6ft0KlpzGRA5YvcaqbYkNLaJMnj
	173YkGapWSrreu9q4FNqQIZLDG1c+R29gCv84GhunzDMAhAHwrqL2ZpaLtu17x0QdrA093rDHX5
	RG2kGiP5Hfbh9FKTHsx5jRoD0d7ofkac8kIXYTin1bvABI+OPW4MJdrHNdiUsj2xS
X-Gm-Gg: AR+sD107AsytxjtpqmK8EkR2EhwbkHDeZNaoiMaohYRzgSNKRWxoc97vrprSdSuwPGA
	opMHWjWq0OATr/qwnbC291xbs64JdqOrcNb3m3IVnz2o9xXdYzA2c/fplx9ZxwvOcraWeDd42cy
	5lBWFMJS6CNHxVakz4IW+LxMtnvWIHsgJlb3nrRNKPeMMWYIN+gt2n7K4r/dkHy6hNHQPx73hGv
	dftoJSTpDGKlFwmSzDu9FBlK6D8gZszRbbAJ5a/URn8XA9DuXVfW3So0CdCVW4FmlI2UXkawiDg
	IIG9y1bNBjKgTOEcrtILledZQM77wQbj8m0DgDiV2m0j8wm/tVXIZOMzE9+/7QF7Yk09skl4yPN
	smZcTnus=
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr263838021cf.21.1785846127912;
        Tue, 04 Aug 2026 05:22:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr263837511cf.21.1785846127326;
        Tue, 04 Aug 2026 05:22:07 -0700 (PDT)
Received: from hackbox.lan ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm42940134f8f.1.2026.08.04.05.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:22:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 15:21:42 +0300
Subject: [PATCH v4 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-dts-qcom-eliza-add-cdsp-v4-3-fa593983e486@oss.qualcomm.com>
References: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
In-Reply-To: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqcdljeoFq9W0KTssF8ylgJlXzERbtqo09GVKl1
 xFq/0z8FLSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCanHZYwAKCRAbX0TJAJUV
 Vg3aD/9JU6mZFg2m2G9y0kHRO8DnlTcBdO06XOpQza1Kg2SPpwjlaXVFefbczDYetL1rvUWtQ8l
 aio53el3n1o3GmJyCZBuUAeM+e8ScQig65vY8N2IZo5hvxFI1U9cMogP6hhIvNOS+2tClS5qTBe
 FASeh1IfMd7tZBMrGYH4Zwo7wrWPtyJf3O2Z2/rstwYJvxC2esaGl+7dXQUW8ZahcdzIMy4AsDR
 WGCwiVg+ar7aZFSBm746Wt0trOZZt0glDU7ERC5TcSkLtbm3HXdZfwZHjL5Uk0zFNmiS0qhKihe
 Y0deWwSdxc2gD3FPDy3q7PcZ6nfjK5vh1sV4saB0wDDyyxYm/JUd7HNjaQ2JOgn5fgtmh5Z+q+j
 P8WN4Uqwu85sYUUG/7srf1pT5fttxzuHZNY/U7eci2lrg7TKeRcBN3EyOcn1jMApvnhS4B1ahR3
 AZjbcAc4XFMXrxZJVawODQaDDBQ4uHzFo5+rHTqCLBfJ1mJC7XyHEwF65eJLsR8otODJHE64AP2
 3ADYy00o78a9Y/IZiVlUkNCjZRV/jyr/aYpTAqcLrzUvZWuyyucuIhrTovs6INOB8KyMyjKnD9z
 VI3zcrBJOu2jNpuAVbn+rrryOWn8hiQFrvr745zuxG68vOxbfDtqVFyvtc8D1ZS3ay5sDqIaHLq
 cH41PAsPSI2a0Ug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX7jGROHVBD1sN
 lOW85cpW8dMHx+G8d7wnzMywKEs7CBO+/V9RJJ2QvsJTg6JmBuSPy7s/HEqGlco6trN/+pydwKm
 MYNn81Jz7lLXuYC+BNj8pV+1g8WRcXtV7rsRqkPN2N+Ly5j09FztnBaq40ZvJmJ8j3yoKw7Uj8j
 wDZYse3m2xBYQyn//5Nh0wG1q+gFjAEGxuQ0dVLao69cIPqDkmDr60Yo8c/WWbAlDHEvaD2VdeE
 2Ez19BARw0fcRsR2m5nH62pUa/rjWdSs97JEEMpVoQ0CxdoTz5Sj1eCej5jtHEwWVHlxQVhPnUi
 tYvHlQGyJhQ7YpW2711jjKS+pI7xLiKxXCbQv72RFr1RRwq+ely6fPlsnbW+k7YL85GCWH+SoF2
 JLl5p7s8Vo+3AWGcR+nK3RCLvcdkOz+RUgD0H7U1BM1GhYgXbPaKEq2Oh5iwPB+dsc/u/DJUATi
 vHcqWHK84nH7e4GyiRw==
X-Proofpoint-ORIG-GUID: __LDBVfL4mDW9FNbgo7nEBGMsoPUr9Is
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX0GZH9Bj1bO9q
 TrLbH20sSoL8rxA9pOXwEzEQQEavkmXmpLMq2L7zi2aApyY8dbbyfw9cQTcACtsF6BIMLZ1ydXN
 Jt2xjtRqbzqRBhyNjJdVR0i6b29PzHA=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a71d970 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gskBRPyYVKVSocykC0cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: __LDBVfL4mDW9FNbgo7nEBGMsoPUr9Is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040099

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..c55947f52123 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -381,6 +381,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

