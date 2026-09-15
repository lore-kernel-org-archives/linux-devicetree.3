Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC56A485939
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471326; cv=none; b=G3vup0mN7aaOe3BvR2JXF/4Uu+RX44P7j1dWjYsIummZjqXRbp4Tt7sw48cFXV2kd3DgiIlQejXgGsfrbFXUVVienG6FiifpTSvpiXqiok+xfMuFhnbalQDQsqXugyOx73D3lnqMz5res3vabjmw4r1q+LTD5z9zwHtgbkTL0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471326; c=relaxed/simple;
	bh=2No5mlpVwB4AdjtOOu0CWZ2jHtiVobkOSNzvHZ2+PWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CG/egLx09a9lr6XlbQ9MqhYj2H41XASYGKZtVC8lcXlsE+F39XvJ7s84PXu64dNNqRZaBJB6VFqcZlGXa6b1IudmBbD6y1iysSJbS4bxPpbaqOIOfvIQen1+skN4jeAu9CX/OYOh9e7Ti1QhRgKxDXh8eDR2Vvp6VltP6qdeqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnSJ95et; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4Jw61CC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnSJ95et";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4Jw61CC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h2Fo2086719
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xulq/000/ULLchJIOg/N1wH/ItWptfBKc1m2CXViGcY=; b=CnSJ95etg13x7wJZ
	X57qFMZAtjLfNbLRotEQKqUUXnXWDLevJUW4el1TB/2Ia/dW0DFg5MR+V5uO7BUD
	3nN2CrP52hnvHWSz6alG8LV3gLO64CwCyuP3oGIcbMHBKGrVsKm7QrBBVJ6k3p4W
	eK5mAoWss3S3hKlHKDwHiQ59Y79hqfinK3IsQxdb5IMcIYDcaWR++lDgFhkNYOaH
	zYSQzL4uDsXXMu0fvpNMAJeReFxQq7J2t6f30ZL7ZK57YjQt8Kt/Nh5cPVwcqz0E
	ATh5AqeXwKKX6mN0MJi+bEJdRCbhxYyPvVzUDd3aS5C6XTvUSSzUl9nea/1tm3vk
	R3YzOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp947g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:22:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3396993a91.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789471320; x=1790076120; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xulq/000/ULLchJIOg/N1wH/ItWptfBKc1m2CXViGcY=;
        b=I4Jw61CCywq2cm2TIrX+ri0H4580lcb9pY6zRj7nW1GcS+TlLsRjJqFWK4QZEgzFOT
         PyTzSgHEFWtIg0sZIB0OqDsmJQd4XAx3534TufETwBhIPWYKyiNeVWm9houmkDX0xsXT
         y5qIkwuqYKP248lVnhSpVlH8dYbvwenN7ikgik9a/M0gS0IHvFJI/TqSoszakzmdQB4M
         gGM24j+ATNYoKFGC5xivNnSY8Cv01aMat7DYNJA34C0JlNozwFhTYHOehg1JRJnqGULK
         cHxe9KjxOmo15wVs9vr2IhkcseHWKoym8bYOg3EsID8uvgZek7Ja7t4bz8MCQcO2dvXr
         7GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471320; x=1790076120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xulq/000/ULLchJIOg/N1wH/ItWptfBKc1m2CXViGcY=;
        b=2QUbMgkpcuZyKQ0Wosj1g7H5iWnP/6M7Zh+832KOZSUHHK0+My9sKtrby3U/tixTNq
         vJOQrTHlKBdXqUumemj/H4ab7GHMKfJi6hMPKSP0HBgUpJEy18XIclDKkgv/R/l0ZE0a
         +Pu9N+BEyn6hqf0TcUoaAlssrH4kpV4QshUTGD58tQdl29wrGUcFRsy37JhuiB/nAEF4
         eeiS5Vcdu4R80uPWEF9FrK3NAGLVX7zfzOMPLWzilBRG2HycI0hiYEUlNi8JVkQKyMZ3
         lA6BSnnOH7kxNkmD7H/AaTj/lAEKUWDcBUvmpkKbz6uGUFKuTkBitVET0ktfEJHi6tCh
         RURg==
X-Forwarded-Encrypted: i=1; AKwUvBwjneZL7NesItWyRUC6VU6L5Te/g3OIa3rMYH9iNVM+WhPGApS4WXnu8Hu4H0bPnVQ+TprwY3Q9oSpC@vger.kernel.org
X-Gm-Message-State: AFuF++lVxtXraQLoli0pZtr+CTrePRGR9zp/MPaFT4uxVHxF8H/zmgdD
	u+lRVr9BPnheATr/VIwHTg4pXbHFh0Q3FmkrbTg0HdhxSW1ve2wIUC/0bYLsO4MssaY/oWQnBCE
	+L5aKxAvQIo1vhZxMVcWQUuTyVjNgxSlTfrQw2V1Bioc7+O32aCtGfn1k1Xb3c6fVGShbaoc7
X-Gm-Gg: AYBFou0XZTfwNkxOxqmlgqdM0kbGaT1+aMZC0YzD2OabUr1/CTOeyq9XEYy0e8kt5A3
	GEjLLkJvEjqxI+9vlWn74JlBYNPBhvvv8RJKeRxvkxF4EUSsJnNRNakFC1/Ctg4leJvKcHRtAcs
	4K5wlJOhG3GyHdkxP92fJc7CLYQ+ur6++q5cQEw5q5AsXPN9EUVSJI/DdtSg55w7d4Uibdyxk7q
	smdIU0SwbM0JhLUjy37R3k2N5s63rHbWrvV7SLApFvEFaWKMfAIIvuGW7bR5CYizWPxA2vmPm/O
	m4str60Jv6aorSqlaRpABpY5inaAzmUwZf4+4RTnHDeE+zc7BmWucOKW0ZLIOs+7zrePhaH8CFL
	s2hod69ECVfu/nvCr60iXJ2JwSA==
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr5444517a91.9.1789471320098;
        Tue, 15 Sep 2026 04:22:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr5444461a91.9.1789471319539;
        Tue, 15 Sep 2026 04:21:59 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm34002659eec.1.2026.09.15.04.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:21:59 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:51:53 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v14 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aqkqUY4BfXo2HuGT@hu-mdsor-hyd.qualcomm.com>
References: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
 <20260913-lt9611c-v7-v14-2-534b43a07662@oss.qualcomm.com>
 <20260912215110.11BDF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260912215110.11BDF1F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE2NCBTYWx0ZWRfX5qxgD6UCD3tm
 lzUj2yLTw7IZmyF/cw0PTjPsPiQ8LZpIGZWRoPdxApEyQvZw+km9NkMWKVswjSrd1bI+Hb8t0ar
 XbWTZrrUGJjP20ktQD7ScEKGvTiH0YA=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa92a58 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=36FZGce6BDuSa-RBUaEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: 5njjcvlePOK9UVfjcjPVSmcr-cz0CXiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE2NCBTYWx0ZWRfXwNnwHX1SgO9T
 WF46Fzet0V3rVCBHApjxkJfCQlUByhDiVAMBOvwhqpT8GMacjZxUz8gk8mWn/UkIlp/kuw8rlCi
 Pe5oMvJdzo3jFusspGZmIrtFQUMfQiKtqNRrZfAVRgja80DH9endWBeOCsBHV7q/SDyHhjQ7cUW
 btDw2EY7N+cVpBUuAOVmqdA8noUJNQpVxREKMiwxbkXcfxJIl7HVmdkVJXV/IUNtTpEUX3UFwnf
 uGJ4EXck1CILCs6weNK1nhr2uchTNCzhkhSsBbSFn1Fv0XKp67nKRq3D8DGXLpmYdj83o3+4qn0
 bnP7ZulLIkuwAUZvuqaCGjKalidLWoC5n/UTgSYSb8k24oI8E6tzOsGdz2wnfNi8F9LU84qXK/y
 HvELyDpkfK9yMx9yhWbFlz2HAfGRVbgxjirt/D0jutsNXaaFVtiIw74mAieNCqLWOUDNp66Bmxc
 bCOhzAc/ddz8v1CBTgg==
X-Proofpoint-GUID: 5njjcvlePOK9UVfjcjPVSmcr-cz0CXiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150164

On Sat, Sep 12, 2026 at 09:51:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] The driver fails to invoke the DRM HDMI state helper to flush infoframes to the hardware during a modeset.
> - [High] Missing polling for flash page program completion before writing the next page.
> - [High] Hardware reset causes silent desynchronization of the regmap page selector cache, leading to corrupt I2C accesses.
> - [High] Incorrect interrupt clear sequence inadvertently asserts clear signals for other pending interrupts.
> - [Medium] The bridge driver completely omits an `atomic_disable` (or `disable`) callback, preventing the hardware from being powered down during DPMS off.
> - [Low] Data race when accessing `lt9611c->fw_version` concurrently.
> --
> 
> commit 00cae86a0097b37f64f26f28bf0a922224a6461d
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit introduces a DRM bridge driver for the Lontium LT9611C(EX/UXD)
> MIPI DSI to HDMI converter chips. The driver supports single or dual MIPI DSI
> inputs, I2S/SPDIF audio, and handles HDMI infoframes alongside I2C-based
> firmware flashing and power management.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..fbd6209287998
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > +static int lt9611c_write_data(struct lt9611c *lt9611c, const struct firmware *fw, size_t addr)
> > +{
> [ ... ]
> > +		for (unsigned int i = 0; i < LT_PAGE_SIZE; i++) {
> > +			size_t index = num * LT_PAGE_SIZE + i;
> > +			u8 value = (index < size) ? data[index] : 0xff;
> > +			int ret;
> > +
> > +			ret = regmap_write(lt9611c->regmap, 0xe059, value);
> > +			if (ret < 0) {
> > +				dev_err(dev, "write error at page %u, index %u\n", num, i);
> > +				return ret;
> > +			}
> > +		}
> > +
> > +		lt9611c_wren(lt9611c);
> > +		lt9611c_sram_to_flash(lt9611c, addr);
> > +
> > +		addr += LT_PAGE_SIZE;
> > +	}
> > +
> > +	lt9611c_wrdi(lt9611c);
> 
> [Severity: High]
> Does this sequence overwrite the SRAM buffer over I2C while the internal SPI
> flash controller is still programming the previous page? It appears there is no
> delay or polling for the flash program command to complete before looping back
> to write the next page's data to SRAM, which might silently corrupt the flashed
> firmware.
Will be fixed in next version.
> 
> [ ... ]
> > +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> > +{
> [ ... ]
> > +	ret = lt9611c_write_data(lt9611c, fw, 0);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to write firmware data\n");
> > +		goto out_unlock;
> > +	}
> > +
> > +	ret = lt9611c_write_crc(lt9611c, fw_crc, FW_SIZE - 1);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to write firmware crc\n");
> > +		goto out_unlock;
> > +	}
> > +
> > +	lt9611c_reset(lt9611c);
> > +	ret = lt9611c_upgrade_result(lt9611c, fw_crc);
> 
> [Severity: High]
> Could the hard reset immediately following the CRC flash write command abort the
> final write while it is still in-flight? Polling for completion before resetting
> might be necessary here as well.
Will be fixed in next version.
> 
> [ ... ]
> > +static void lt9611c_reset(struct lt9611c *lt9611c)
> > +{
> > +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > +	usleep_range(10000, 12000);
> > +
> > +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > +	msleep(400);
> > +}
> 
> [Severity: High]
> Will the physical reset clear the chip's internal page register back to 0
> without updating the regmap cache? Regmap's internal cache of the page
> selector could become desynchronized, causing subsequent register accesses to
> skip setting the page if it matches the cached value, but occurring on the
> wrong hardware page. This would affect accesses in probe, firmware_upgrade,
> and bridge_resume.
The driver uses REGCACHE_NONE (no cache_type set in regmap_config). With this mode, _regmap_update_bits always performs a real I2C read of the selector register before writing it — there is no cached page state that can become stale. After GPIO reset the chip reverts the page register to 0x00, and regmap reads that back on the next access, correctly detecting the change and re-issuing the page selector write as needed.
> 
> [ ... ]
> > +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> > +{
> [ ... ]
> > +	if (!(irq_status & BIT(0)))
> > +		return IRQ_NONE;
> > +
> > +	/* Clear interrupt: hardware requires two writes with delay */
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> > +	usleep_range(10000, 12000);
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));
> 
> [Severity: High]
> Is the second regmap_write unintentionally asserting clear signals for other
> pending interrupts? If other interrupts are pending (for example, BIT(1) is set
> in irq_status), irq_status & (~BIT(0)) will write a 1 to those bits in the
> clear register. This might permanently assert their clear signals without ever
> deasserting them.
Only one HPD interrupt is there.
> 
> [ ... ]
> > +static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_atomic_commit *state)
> > +{
> [ ... ]
> > +	mode = &crtc_state->adjusted_mode;
> > +
> > +	lt9611c_video_setup(lt9611c, mode);
> > +}
> 
> [Severity: High]
> Should this enable path invoke drm_atomic_helper_connector_hdmi_update_infoframes
> to flush the infoframes to the hardware? Without this call, it seems the
> registered infoframe callbacks are never triggered, preventing AVI and other
> infoframes from being transmitted during a modeset.
Will be fixed in next version.
> 
> [ ... ]
> > +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> > +	.attach = lt9611c_bridge_attach,
> > +	.detect = lt9611c_bridge_detect,
> > +	.edid_read = lt9611c_bridge_edid_read,
> > +	.atomic_enable = lt9611c_bridge_atomic_enable,
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 
> [Severity: Medium]
> Is the omission of an atomic_disable (or disable) callback intentional? It
> appears this leaves the bridge permanently active and internal PHYs powered
> even when the display pipeline is blanked or during DPMS off.
The chip does support power management via the existing suspend/resume
callbacks which disable the regulators and assert reset.
> 
> [ ... ]
> > +static ssize_t firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> [ ... ]
> > +	lt9611c_lock(lt9611c);
> > +	lt9611c->fw_version = lt9611c_read_version(lt9611c);
> > +	lt9611c_unlock(lt9611c);
> [ ... ]
> > +	return len;
> > +}
> > +
> > +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", lt9611c->fw_version);
> > +}
> 
> [Severity: Low]
> Could this result in a data race on lt9611c->fw_version? The variable is written
> under lt9611c_lock in firmware_store(), but it is read here in firmware_show()
> without any locking.
Will be fixed in next version.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com?part=2
