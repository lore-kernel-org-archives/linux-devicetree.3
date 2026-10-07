Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E337AA96
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388064; cv=none; b=eBssgPO9fBF0dZUKzuWETSG/IpzKBSLDTjVEHwyzYIU5uXW+rGDN3mDeWEH+cb1JfWR4vxKZmvjOgxp/gK2E4WFR1QAqPgzW31JhMZ08oHBQFy7aW1+OKXGUPll+APf5T6TZtnos3HpuCHxcsiIgzabsePcNaRlC7EMqZo/3KXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388064; c=relaxed/simple;
	bh=URSPLh2bUnBt6WhRmDKNE1EsstWlz9OMjbqal72jSVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UARATbO9nCHp9H45agiBcj4h+y+bqhu6ny+l9hXLuVaqw/CfxM9Kjppj0E4zGSJGOAaM/IUZ9k1C2DxuQVpC5oinbUlj9jqEd3es4ev6bsypUOQ/hMQ8c9rTQKG3rkpTKtUBGSKt42BEdhdMa9i8ySAU5kVFsLBHG/C5agEk3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YablL7o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4JhpEt4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YablL7o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4JhpEt4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtQto041096
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 15:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ON1POuxQT8oQUVPgZEgmjC1U
	LppcBaLaYzlRsmpMyxk=; b=YablL7o/pPESIa7r70OHWBAefLpbpsHZgghoj/sw
	bWPl0OF7H5HMj2f3weN47jO4AgwNJIv2oOurH70gAm31L+lyM9ULTguZNWHswIQX
	aUqbLqDlidSzQAs7hOq05qz1aGJ2TJzUkOrmcrCW/1MmYq1CkgeF45KOQ6ggE+4B
	VtaRG7BMRZkNUb2+8nuX0bx5aW0x5kKVd6AmcfI6PZ3IMe4uL7OB/V6rh6kQ6gGy
	jtkqdEHZ4Yblrxwb4Ru6RgHaKr+mWT4Jf2HuCoe9Vynwpy97y7qtNOaMZ3WNyQUg
	bKXLP6TQFZbirwSj4I4LX4h98th9ConX9nolubRBRftUmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcsw4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 15:47:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so781591685a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791388059; x=1791992859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ON1POuxQT8oQUVPgZEgmjC1ULppcBaLaYzlRsmpMyxk=;
        b=S4JhpEt4T8I7mDK9AE9s6+dnD8xmA6KEHLk6Uodq0C2qjDO5qZO2HmEAW8nl8uDfT3
         1k/JVdWuxUyboiB97nUQt7UNBjYpBRCuqQq9N3coxdn9WBOJ2SsswLVF+ZJ73LjryUNt
         74XLVJZQlA6IvOnCIqPL6Hple0wzyL8jjwZdGQGrCATd69Q/NJBJfh1c/pRWCrSfEpPY
         UIacOVJJco7QNNnrh0Pv3yKFOD+EOmDbiyyU24Px1+IOy+CPgJ106Y5fodw8smvWYJ6u
         S6fIuoInIHGwysypIL+OUVQpxDvJzNgylMwrLtya01g1xMeM152/akwmAtYywIsSFkCg
         b1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388059; x=1791992859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON1POuxQT8oQUVPgZEgmjC1ULppcBaLaYzlRsmpMyxk=;
        b=cnhUVakvhj5CwPAKiIh841hRq8FmmudAG8k2PETAkb2f+siVXUKJjPoq/dmDM93jOx
         kfBHPP1PTRbKimwjqSFtqJ86RGLGzMrW/TuD0E2/52SiVYN6jxeounQT6rPip+lTv/pO
         9M4ie9IEXG9DvhOsfyTF7S/gDaROZWZ761/dKbElWiSD36nZuyjf1UF9UHesQURCWORo
         LcA69/Jyc2Tx8g2f7sq72Ec/+EAnkFJFp44cEy/zeTrAuMpVafHJXFt7PFW7lc9n9IpR
         46uZ33xL1EsyTre+y8cFtrrOp5XPz9oAx1nkT0QL/4aLg7lyGO0GcXY1a4ycdvHncdyp
         6DiA==
X-Forwarded-Encrypted: i=1; AKwUvBxGJgCbZR/jpOo/x9wm/nmywcO9mSp+53ESLezlP8dep8GsovdZAIspiT8U6YcaIoMKCF3RJP2TBsGV@vger.kernel.org
X-Gm-Message-State: AFuF++lrBEVr80+GrXVYCe4zPeZlpCOa57IXA4S3ymyA4xcrPnQPyqZU
	Wi3I6no+lWd6zvgQsz7y5r8AQg1Uqlu1ELk/MKxZht+dIr0UEAdwqfPhAUIKDEx6VaZzC1RVRVa
	T8NThFG87H8IdygcSwV7kYWP/dfANStJbuGkVMxv4V6jBnF4pYaSYwyB52sdmcxk3
X-Gm-Gg: AYBFou2yez2xnFXUfbbSrONkniQGoQ9yK8ALT9o/pd8265La2QGdP079Q22OGwII9VI
	VOy6JMUalb/ESndwpgpOPjuk4YPlzmeynKWgm1XOTmhAVoMLbHl4KUGtdOhsy9eeVqpnoyX1M0+
	NaCU3sozvaP01+Cv+1RCBEe1OrvgTs/xtM1loKFqhSNyz7eZ7ADp3xlzh4vud6jW4/OZQ9v8P2e
	3uH5lghTURZ8zEnuGFyLqDY3stBIvkGG+Prx5BgiZ0P9OVzC9eeTGSuLSJN90R8Nl2t/msOwniy
	SebFmemBbs/KoTNqicvqpEsO8eTxGZAacPx20aVWvHk6FZo82X1K84HXY/NJk4j/Gos4OlSKVj3
	6ggHQigGLuR6IANmUFzapF7Yjh5pfJqN8VInYvaWtE5MG5lXZCNoTN/uchgrr7f+i1UiCQDHsTy
	nOCeHL8B64Nwz2
X-Received: by 2002:a05:620a:3904:b0:939:ff85:8067 with SMTP id af79cd13be357-93e9b74d90cmr499754585a.30.1791388059160;
        Wed, 07 Oct 2026 08:47:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:939:ff85:8067 with SMTP id af79cd13be357-93e9b74d90cmr499748585a.30.1791388058556;
        Wed, 07 Oct 2026 08:47:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a8466sm170150e87.83.2026.10.07.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:47:35 -0700 (PDT)
Date: Wed, 7 Oct 2026 18:47:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <unvey6hlz5ov4flgzza7f3i7nowxym5ik3dd7jkzx3yiqt5xqp@ci3z27we45e2>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
 <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
 <p76qp5bhijenec2ygj36dd47uxkeyk6kztccbuhblte5lqn22x@yikvkbipjbae>
 <7e8ea792-2336-4252-beed-7345815b0b90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e8ea792-2336-4252-beed-7345815b0b90@oss.qualcomm.com>
X-Proofpoint-GUID: mRtpv5kZs8bMGYRc3TADaRs1rhe8hHb7
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac6699b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0f0GmaTcbrnyVoL-888A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MiBTYWx0ZWRfX/mQlHLPE5pEc
 cqVlbPhPErC/h06CMOs79jskmKXv1yAwwFStZN9Qj8TkHI87C/vWPQlCc05AJF/zgrVzzWgxRca
 BJGpit3C6MktjXg3bF2QzPlsjWADsaI=
X-Proofpoint-ORIG-GUID: mRtpv5kZs8bMGYRc3TADaRs1rhe8hHb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MiBTYWx0ZWRfX3z5eeVaqR+Ug
 B+aJ/tYodpfOXKihsBHVcsAFlwC08xCBxOqbeEb8s0lYhQ9maENBKl3Xz3yEEyikthRCqmzh4zp
 AgjS/WxggldnztduVuguegfGnUAiCveT0AYVloCYYcxx2HmpwKFa7Jkjig9X0CFgaSVMLRdTY/L
 nSJk96A2j1lLgzNYBuyMesHshk2p2N0+Q6LiObztx1ECz6couRD9ImZj1lQVPnUemzISXTCNqsb
 qQqfzC7yHWcR/Z7yygWL6kLu0zVquV5x16v0dH5/bHSVhIEsERMNvhU+mIoIOF3RNK7yH3lCKWF
 xvZpFYwIPuxMuRitd7pleMhUYvUB+5+woxZP29yGEzpo2G0GEk5+SyXcA134VpCIlUYuKZ3xAoB
 TxZL8OQpV9hu987F3KB+0LTI2+LWdpmQSbZGql90fYily2eLfTwlwUpH/+Bq5Hvr6YQS9KMNja5
 CUU0wztKE/mDc8c9cDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070062

On Wed, Oct 07, 2026 at 08:15:39PM +0530, Pradeep Pragallapati wrote:
> 
> 
> On 10/7/2026 7:13 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 07, 2026 at 05:03:02PM +0530, Pradeep Pragallapati wrote:
> >>
> >>
> >> On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
> >>>> Add the init sequence tables and config for the UFS QMP phy found in
> >>>> the Glymur SoC.
> >>>>
> >>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 99 insertions(+)
> >>>>
> >>>> +	.offsets		= &qmp_ufs_offsets_v6,
> >>>
> >>> So, is it a PHY using v6 offsets, but v7 registers inside?
> >>>
> >> The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
> >> Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).
> > 
> > Mention in the commit message, please.
> sure, i will mention it.> 
> >>
> >>>> +	.max_supported_gear	= UFS_HS_G5,
> >>>> +
> >>>> +	.vreg_list		= glymur_ufsphy_vreg_l,
> >>>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
> >>>> +	.regs			= ufsphy_v6_regs_layout,
> >>>
> >>> v7
> > 
> > This still holds.
> >
> Do you mean changing ufsphy_v6_regs_layout to ufsphy_v7_regs_layout?
> If so, no. ufsphy_v6_regs_layout contains the PCS register offsets, and the 
> PCS register offsets on Glymur are aligned with ufsphy_v6_regs_layout, similar to SM8750.

=> commit message, please.

-- 
With best wishes
Dmitry
