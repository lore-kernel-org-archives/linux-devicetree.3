Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280956;
	b=NQkZJBCvnwAoayGLxW600Z1dAbo/4U+uMiiJ0V0l7DDHzFf5XJvqZC7viNwPZ9kjLt6W
	 D92UmeMV3dvVBMi7Y30Ow5giY8M01meEqIuaTNFXJ7UIKUdXlmLvu3IO6G9JYhUCG06xv
	 PcjiXIYvIrHFCH+FfWicxg2kUiqAwxTTf/NH3dZCrr0vyzDyY30QuHh9UuOxMePmTCmjz
	 Xpib2sR9IuoX8gm/vaQGR9rQcox+IfxDeRIE8gCdkpX2VufL/qlgmFMfjP7984WN0aeB+
	 6oD4XE/4qd+KclX9g/yhNqPKVmHoY6NZKIaZq3KE3szFOa9Zu+8UOkipe4sYfwUdhqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
	b=yVqIKoRU0dFhU1pRBD9Zg3ikya8bdiwakRuR6PqXflpOO6yZERAHZ/bepxFmKXnLFoII
	 xH/IfS4SFHwXeeQbD9zmDJGBeNt19KG2jBt5jIrHstsUh0VDRMs8LEeOYCEfLlp1FcwG0
	 XIFrvDdaT5i7HzZVXwxXKtNw52jYlV14q41ZqMmt6iWA6aMSomWjDvEvl717lWjMxpSRo
	 +g3f3RijukG+h8JRDuCB68+0lnb0CZiJdw1m5cQYrFO6NQiFhENdNJpW/rUmD4Ssqag71
	 iFN3wm5ffx8d2ZaAG09xXNBzrXntIX3BOamc148Hp7sPbs8BtLPDkWV7pzAEIczBbfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGf7umLf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bEcIEbp5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2F606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGf7umLf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bEcIEbp5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0ir8f2827931
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=; b=BGf7umLfDX1gvYY8
	4UikIzfngNvIaEW4IscmvZDYto+0cq75SSqp6rvnM6GWEJKQmtyX5L1xtKBRL+hB
	Xs2ZFol9WLGrdG9XZYS78ZhQT940fqlcjQW5sbArITyOWEABL+j7s/GT+R5Axkmp
	Nr96sjF72Dg6aTgKR3V07ujW7Q7zTZy63/9IxsWtfpbpcoSNiqGePLlHmnPsWKFc
	pm4TuuaN6kUv7XG/oRoIRLAV1wVVsIWZUIHLe9YXPVSPVUhYIcBgVT4AFgkTbFY1
	I+U7RIIMKuF4MGTNbyaL0RxMNweaG98vqkrxkcaONsOGUZgJNySeV/+2vfw924oc
	QYR05Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qu1yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso1350590a91.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280955; x=1794885755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=bEcIEbp5B+9ncGBCgY6BY0XZuvJfU8g+Z1KMEciXI5/4KfT4wdJ7hUDqaiajfwp/WJ
         T3C6CiUr+GwIsq0FFnWyCs+rZLPOpcxf1EEQ8TRpMCDNZOJpMH14AtJ3caFhe7hAZaT/
         EYu/oFOSStxw1WvTu789pjAFOYb93F3aOUFqvcLPQ0kD8eZkZIL8pmYSMDS3SrlszQ0G
         7OsXz5HZxviQw+1sJu2QZewXYJQPdM89O9iPpVX2F5RgE/X2Dww1FIgoT35UmM7zfIRa
         TpawRRDf1EaTmtrM3Dee/rlqxYQqA29DREPTyImLnaFqIkAhQ1f1sUa4XEVtx95qNCrm
         V4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280955; x=1794885755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=efEY4R09VIM8x1Pza4PL1fRsxHVwJgkcKv6DJKjCDgtzvFgDbzVYFjdtX3Ol44qiZG
         SdK1TiBMZIRKUgoD9FpOoqfLCHzUJvabLrcwdGU/ZhpvgCv4OasnpiUvDErLCeC+O3xe
         eIFcA4UQMfdjUhXd+/Ze8XYhxCUsGpHRjVaHT2OGDPrQuDHBGHW4iU8EDx/P74xPXAw3
         liGUDbkcKkn/3fvsMJqsihwp938qDTQZ8sb3DAA7waaMWJq/aQ/T/Sc9GiyHLMJxfous
         VZPNvLbUtF8u+M+Q9d8hrIF6DptfI6Y5erP/fHClcWv0Vm6KVtGk4mXWA1TLX/oT5L3Z
         BMkQ==
X-Forwarded-Encrypted: i=1; AL+hErHdf4aO2EAaJ0/ScUkCx+O2V4kOgGwAoRCQA4IZxTHnntg/SoA7GZLKc9K8zbgWgYQyfFvPfbamHXTk@vger.kernel.org
X-Gm-Message-State: APuU4Z8HH7USIz1h/Ge80DXuQ3lk/qC2reWcKc3tIUmbVMRaTHMrYJdO
	f4+G8d2KLThfeNfgRBTZrXC30ZEXH4diTOvwtTCi0R/BBYdqK5pejEHljDsVJQX2hRz8o1Nolf4
	A/d0gQM4pFP14BjAk5nGHSXit0cEzBuAuq8/HzBzkITzWrw+sDv++U+7TKIqguF6d
X-Gm-Gg: AYBFou1X/hnxHz2OYOdN/HvCJOWahcKPR7TUyNVXJSd+AOU5Vov7eBWLaKPzDGp2qmD
	+Acv2dHRG1DIzxAOybFeKzszVEQ48l6h2AHwUJzLMDiSv411q74ko7X53UkKgnkf5WI4TkLwQ1f
	VnvuRUkHixqqF2SjObhmcFIPQDYdJ09WxqYwHNfZvLk59ABxkoX/E0/jM/2IXrH+iR9wnL2ZgRw
	Xx8oEMZ5MNu875I0o+aCbUOWcIuLh316wT+OAj/X4PMK01fM5k8vH+sHoRrYldV/brx67XJm51f
	N4WUVoXg5dqwBXuD/v+pE3dRttxenRZP09/GSufROLLfNP3bWLrUr4g1vwXhPXMCNpeRrVIyQPu
	ftm+bRdTiBdhq3LE23MCxR1eHrJ7+mxwa8Et/ebwuXiOG+Q4LzjuyuLXI1CpRPUd5rt6nwkyhrs
	Lj5QhY5Kjk13ZBopIJdZRDKMdjNCCWZO16bigv
X-Received: by 2002:a17:90b:4cce:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b166aef2b6mr1678916a91.3.1794280954709;
        Mon, 09 Nov 2026 19:22:34 -0800 (PST)
X-Received: by 2002:a17:90b:4cce:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b166aef2b6mr1678896a91.3.1794280954213;
        Mon, 09 Nov 2026 19:22:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:33 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:25 +0800
Subject: [PATCH v22 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-3-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280921; l=4507;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PnAggtb/hoPMxGkHLkimiPJx33tOJTrsVEFsbWRzHrM=;
 b=JIb7FK1pdxcETJyjYy9JDzKhg+bVjOk0IPKk9PdAH6GPa86JV8TL9t6s8wFBQEYFTKW15ILCg
 EwDaYsCPCo0Cdm+Fj5leDHj10x9k8YPvtH6blD0Xp6jJ8VePXwDRXUQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX0WExKB56HjYJ
 iuws/7HKyKXNqUV44VeX8kPE/JCcISkgYI/nItRzs1BRWpzoddYPNb/uzAT5A7mNxHmCLOmTF9+
 ZQ8+1bpaGjy/CPZz/hd3+9w+RPQf5koT4MDXHccv4UxtsJDT/RYku0xq072avaLp/f/N19F5Hwj
 tvzON7gfjRgfei/u0NwK3qY0oeCxeswWX+bhQ+vXVzDVpy/hnIsWQsmxUYprFq09EB1EkU3tys8
 1ceRIGan701aryXMvU3BNIezB/WX7eTWZQZNlKgkFvX+470EiUgP5Hmlg52ArhRMLabS1Kr3005
 FjdsFhZ8wHc2dD/xwmCR725gF3Am5wFJmMeIaOhvZrlKjOEuJANldQCZgBcb+gAkjCi8rFU+2EI
 NhhpcZxH56ZWCumhWY5wH1veRLSXKZticaFrNKfGkruYZNtP50xZ7OYnCQa1UtQlyFbh0iHCUI8
 83zOKnhPybTUIBLd6hw==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af28dfb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TPt5YZYWydgKV8fuSqQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: sbqRMy39hIAdHDbqRLN8W-yIMY1NAPUb
X-Proofpoint-ORIG-GUID: sbqRMy39hIAdHDbqRLN8W-yIMY1NAPUb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX6/uuYPNeDzsd
 GH0AspqyPCaPaaWWzqLZafDTNI1yPxqKrwA6gnkD7ZVgTE3e5+N4mH0+NaboF9VowAuQwRI2D7Q
 YXXSQGdm/p2ebYx2wL2GFulKrhvURvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e9213f456834..5032f5598e15 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode or there is no free buffer. The ETR is left untouched in both
+ * cases.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->is_free && !nd->reading)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->is_free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->is_free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	tmc_etr_reset_sysfs_buf(drvdata);
+	if (__tmc_etr_enable_hw(drvdata))
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 7c604b9f92e5..30b15c38b080 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1

