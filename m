Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F30E223DE7
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 00:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988428; cv=none; b=VMBBoytQET0aQ0MTeAqGOvzAbh29GvU9nnfVTvzLCiDDCDYQJJFuJ9yfzjT0sNgZsHOt+0wpfSKED7FEWV4pbTLaDr13Nns5pEGS9DfhdpIjca37taIH+HnGe7Nqa0fCLOdfLBz1dIl1cWfdA5xRQt5D2zV7E41ogLW+y42+fJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988428; c=relaxed/simple;
	bh=33LME4hv75+NsrUKSNfoFPL28+UrDXNe+o4qJIbYyI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFgqNGF/cXh6TqIBX47oRfbgcFhme7KGsBTtBt17HbaB3fJ6Ei+i9vRiNvSFuGTsxT2sOJVk7Ww36B7u3UAgyjvVfyA3FN/0SwbCcpclPbg+9sSK5HCjIywvB9U+YUgTY1y0FoRUyEWLbHfuC8Ml3Iq9mAuMCpi3vHXAcvfh8Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmrw37eX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIpWmVTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmrw37eX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIpWmVTg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne2PQ1956286
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 00:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL80ugemMWRtDW2vSlsMcf7Zak5YaCa9SLUyIJHsouA=; b=kmrw37eXy6VLn1HD
	URi+EdBB8WmglvmupkKmMxCWNA5OLkEKOXkvIXotgZYpg282D240xBs94RCdc974
	+VCcU4VejxVLmFMb706Aipp7a1A6uIlDbBrVoxWhdIJCQiPu4wi44Up4o7RtbIH1
	roFj5H2qYpGqftRQJQNhGCdlXloN3y1AgWD16cRofo3mtz3ayzwovEG2ujT7VM32
	Gi/BGSp1hSckfrJ3aYOnXmawmpWEur88eR0P3aZ5nbpwn3l2lzKPEo0HB/b0ZJNa
	/rPFjwIJIUPVgN70CjjHtLuQcb/9sHJ0Ce3TPGppM0SIL3uDGn6KMNISs1y1Jm7V
	lJN2WQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2j0ks54n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 00:46:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so34691785a.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 17:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988417; x=1791593217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vL80ugemMWRtDW2vSlsMcf7Zak5YaCa9SLUyIJHsouA=;
        b=GIpWmVTgv7jAW1NzVBVKeSmFwx1AtCPEF2MfCtovYnH4DyREM+0tVWRzfbOFA4os8X
         9+Tzr5znna94zXs+NhK0zAeyJFw49cbu0Um4FwMJfqWj9m4G0HQb56uZyOZlEUgtlMN2
         HEqDg/hFRgQhWKHZjDF92F4Eh6rzndt0KzRGdQ1RSivVkfBky5BCiHy6/uhslKoFeU70
         16zavlK0K8R4snEmj5gzIDcdB6V5mMhalWgluo/AOrwEP/VteCdtUq+467X89wbWHNmY
         LYcmHPmXmmVKvD9y1GbNKbzo9ve/fKsMD1EFHBgpRPGcLPQOYTijXLq5TWMM6oVuNjSt
         klCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988417; x=1791593217;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL80ugemMWRtDW2vSlsMcf7Zak5YaCa9SLUyIJHsouA=;
        b=DPD40tIGakqfIuq6JGTH7e3wlWvPzxAj/wN/EM9RXR/M87jATD1qfrh624tCBiZkSC
         AuUijypYaG2Ysmxdd6vqb39uJNrRVwSt0Rxddn2eiL3Zl/pz8TptLIw4ZBcDfJdaTBys
         YZk9wokdSpdSIRuBvsflpNJGaRqtJLz5FB7L9OE6wqL9ubbn6cDe3MDUTPR3F2B7yyJl
         iO8X9+m5qUEs+FpnGLImgvwuI3UsVl06QpH4KNTc6+rwuH5uTAAxT0VDu+5zYQxqOuqE
         h+IwRGxMf9Z9F5b/CYKFnGBy0MHhO0ObYkKciANiThXPVnALMY9ucfRpDfMSddY8/f6H
         nNXw==
X-Forwarded-Encrypted: i=1; AKwUvBzpa+R7XilkH0Lln693f04rMMxR6NOBilBQ2NhhCuyMRQhHDUQhU+QKIpW+hQ9SZjGr9/VSN8c57Cyu@vger.kernel.org
X-Gm-Message-State: AFuF++msbdC8YqeeKF2Lo3v43fAIFkklZ2xqGj8xLCPQ0iz4anctyQgI
	RS/eE4xauynbNBti6TR5bcGllsGLvsugzeYbdM8qE/ctMtsJwKjsDQjgaGrLUEpaaF6Ue/YmTT1
	w5qPGeo/XawULzfsFhhTRMA6ZMok6Xc+ckKs99aAJ0B2WZzFVwJWASVfjyedc2joB
X-Gm-Gg: AYBFou3gvh56Ox7xlc1tuy9ffe1pbn0Czf0tU282tRiqAcnWXeA8MlfIh1ZLzKCoznt
	egHXNOGCq7xzyjHmwf+DDcn4luDBk0VWmMkmZ9qpZNCRBe3ssEqmg9GeMieJIB/Wi81cNq8MTs2
	d5oF8wFZMLjPB06Me/lr34K8I010vbFKuiGO8I2m6tcLmAgrloX80+koLWWwAh94GqX/rXScMMf
	OJh8zRQ82rIRc5cl54bEOWbj6hoftGqLrVvXEGRgVfdgF6KW3+q2JpBWnfdKNPs4UnR0AvnMAwi
	KgzyXTe7QXPVXE5ALmplh4bLeBDD6kGn4xM8RtHDvz03A4vUil39IjGSvjtvCzlNw9WsHtXnDCn
	LcDIsDmWvoAL8x03o4fKFYetWlgICAHacto8lcevkQd03af3VodvdFxGCdWqkTkdBwJlc0M29o2
	wEPN6l25rczt+z
X-Received: by 2002:a05:620a:a18d:10b0:93c:2946:5702 with SMTP id af79cd13be357-93cf1752323mr610228685a.39.1790988417082;
        Fri, 02 Oct 2026 17:46:57 -0700 (PDT)
X-Received: by 2002:a05:620a:a18d:10b0:93c:2946:5702 with SMTP id af79cd13be357-93cf1752323mr610226585a.39.1790988416613;
        Fri, 02 Oct 2026 17:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:46:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/7] drm/msm/hdmi: Fixes/Cleanups before Eliza
Date: Sat,  3 Oct 2026 03:46:51 +0300
Message-ID: <179098834081.3641559.14344283439671349892.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX3fQOJ/nUxzmY
 FvObGdgb0qKa9Zjjb/aPgUJ9ahKUVfzLlWLWloFTOWjPGBdjzuRcOG+oHLG+htCZXeA0Hv7rtAf
 nqGlYpMghsft0Cn4FfLsIFi/bhfas7j0gUqNJrlt/sCrpUpIcWIDYTfHDTBfE1lkELsvyC5Gveg
 GkKZ16rWdNApRb+x49pY6NMFMHt7DKZFm3vW4EBepR2mvMPUaza0nP6px6O6GKTvDlelKnr4zvc
 0Mtp16HNnaxVPZiSKx5dwiJzKvJmiycU++DaVKLf+I52Z9/C8dNQJZSvWML6kC79rUFtzx20yss
 ExdZDjsQXQ027+m0DLG1ZJsHIeiytB5JWOlcnkT399lpiSj/YpHs+B/kkFAUtESf3ar8K7wqe+R
 lDForVyKkw0DIeOIeM4R2/Xw9iWzGranVAIZRCu9anyCa5thlYHLt44pmN7wNcORecrWCaO73/A
 y8NaM9KKAxoGahIp4GA==
X-Proofpoint-GUID: vmYO1c6rIbDMDb-O5Dj7rPI-RALStMqt
X-Authority-Analysis: v=2.4 cv=Z8B5j3RA c=1 sm=1 tr=0 ts=6ac05081 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=UAEniXUar9Pip7w0YYAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX9ErOBYYpkBuY
 MPQNqZGAWtkMtjV5BukiksCbA0frFnh9a6WbAb24JVu31mJ/2WOeqT+pmyxDTE8XhYp5UH6kNkZ
 YVcE7w2em8pIP4ru/AnTGxI53cgh9Hc=
X-Proofpoint-ORIG-GUID: vmYO1c6rIbDMDb-O5Dj7rPI-RALStMqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Fri, 11 Sep 2026 12:29:33 +0200, Krzysztof Kozlowski wrote:
> Changes in v4:
> - Fix second name in "Properly handle msm_ioremap() without name"
> - Tags
> - Link to v3: https://patch.msgid.link/20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com
> 
> Changes in v3:
> - Add missing regulator_bulk_disable() in msm_hdmi_phy_resource_enable()
> - Set hdmi->power_off=false before calling msm_hdmi_audio_update()
> - Link to v2: https://patch.msgid.link/20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com
> 
> [...]

Applied to ttt, thanks!

[1/7] drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d27f831aaf20
[2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dd6ecace5785
[3/7] drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0499f0576e44
[4/7] drm/msm/hdmi_bridge: Drop redundant initialization in msm_hdmi_bridge_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/07bd8f9379c2
[5/7] drm/msm: Properly handle msm_ioremap() without name
      https://gitlab.freedesktop.org/lumag/msm/-/commit/14fe0ea79e0e
[6/7] drm/msm/dsi: Fix indentation of if block in dsi_mgr_bridge_mode_valid()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8b7a90dbdfb1
[7/7] dt-bindings: display/msm: hdmi: Correct name of disallowed supplies
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3309f5c88860

Best regards,
-- 
With best wishes
Dmitry


