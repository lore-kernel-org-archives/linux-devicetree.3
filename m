Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34773DDAFD
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785688; cv=pass; b=IByMFK44XADzfQQdv3LTeH46QwL5pOVkvhImNQp59t5zfSYlOXtI73mH2V2c4yXKPVBPOWJLH1LC5hWBjORtHo6LAf5T33gBxoVdK3ss/q9VL87BuYMx0akV5/6dAwM4LlStLcqo+avcGveOrX1L5TZh+quQ65vKWusda8F5XDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785688; c=relaxed/simple;
	bh=RW3uGCmb/YZXhvVIK24nGOiOoUacGo/cau2GLFCcp5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkiJZrh5pitKPnm79XC2ybLnOGMe+B2FrJWK6Pzyv6wR8LAkduoOzlRl+Nhx+iWcC004mCofNkYt4Fab+VdOfoT9aIxvAExXKFq4DZOdHLOEphuBLb5YUIOAbFdI50VafGvucVTzmAUHaqQK4TE7Uh5PoY/fMycSlK+X434YBRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5x2+As4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZayxgMi; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5x2+As4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZayxgMi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE043P2970762
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=; b=Q5x2+As4kHBZ7dwO
	+HybY0XrEa6O0+ssDVL2VtMd61gjDHN1TWV0nNgh1AGgETQz5anl6iAFGgjFrdBV
	FSKgIWGTuttG1RWWlOYFmiJhaSDCzyA3r85ZgAmOPuyWa0GzUNRb2U78Gz6EgWkq
	p839gJd8tGRUmM++QNZK+5MXRdKxQVqNrKQxNzhrDiEKX6LXcyyizPlbyTnmgM/I
	bcRfpy6+5yqMmm6a2+Px/8RQ31UUJRrgtTPGJmFedPt5rpPBJW1AbWMc12khzuuW
	z8O5GitKuuyQwHFcrZtlBWAa4sDtjOqu8KQPA560zF8OhgbckVonyllc1R8zV38D
	92wTRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rheku5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:28:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so53066675ad.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785680; cv=none;
        d=google.com; s=arc-20260327;
        b=HLhcuadZb1Ccc5z7x2jRNQt97fDjsu4Afv+LIUcUsqBNQIECS3VZxS3rmJ7+RBXiyc
         RcffrO1Cm2sFYRDNBE6Os3nhFGGTLNT9S287WNaVxrOEJiavm0Ch5iuTPzRFezos/9m7
         LIvrx1VI0oqFMjkxrfUQrN/U0FUUO8gHJeqd24qLHtrVtHcsEhOe/YXMG9EXPYasP6Hq
         RTmGhBnAv7K+OQx7w7+nVZU5xlM21K7etyFhWwlQ/GjWhrUeKIcgRF7dwDotRENTtpaN
         anN0SOR5rjAnFbRBwAgN5WOnEVwxzmCmj9wGCi80a/79Fku6zG+5OcRSJdTc/ew2i/8V
         mM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        fh=mmIoOxwiEA1b3cupVsLldByJfF46OCyL+AiYKEb3fhM=;
        b=cHQ5P2PfDK4O3KhISFZP91php/x9aCeGbO9CkMzkcYJCJLVblt7Fhm9MqDcleE8d+K
         9gh0IDk7qbtRiSv7iDKa+0JbqNrjN0HjA8hepPwkJA1ODGbp/+49G620bvh6C6zWjHBx
         eK2+xk5u9UgfMP/tIEkOxm2e4ki81i9Y+2hgix0uGWuQpIJbXkT2Gaegsn16aFTNNI08
         wIwKIIScilZG/lP1uddOPaA/7ae1g7q0Bl/FGBfrCM6L7OVgm3jZ97Z5svGt7PjTx+1b
         3lku9W6j/Tm6rivv1JP2murKto7S7Gv+y5y89gqEc28uaCJkLkdbaPzef4mo0aGPXVTZ
         g8Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790785680; x=1791390480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        b=jZayxgMiw5A3RnPMrMWk/VmzME1iMPBZD94KEdPN8ICiUl+r0UWLFjV/ZooxoKWElK
         zcv3ifylulK+O31tNoskG7Twv9dEAVpfEhBrPRenm3vdUyMHZwQk7mT97pkgleR8TJRA
         rYJWOlWMQC2Zns//YmvAVTcLEA9q2ovJVmS59/TwuCzwDqWq78ido+1kCuJWOYi4yqch
         XM6WVpEa9JIWZ7z0+P9BLjSpI8tJOiTH8iWLcrG9okHUc2LhlnRcYt2ybs0sOVVw2p9s
         u1FK3cq128UB1OjbgTpfApYk2PemFjyg0jsBECT4rDvTYT8lZTucpzm3q81y/8QCOJcV
         /dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785680; x=1791390480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        b=s2bXnBUgkCX7Q2ynLmKItwCo85K+hx1IqMM5jZeMkOY0mWGZVox73C2yKdWUdFWQxJ
         c+QCE5ycV0PP3ImHTlDTlLmIbEIsU1quPKSWfy7GBhGcAhK491F0ImQ0phpx6gGPuHNH
         D4SL5xn66KEF+UFEBH55WauWBs1CCVltWgaAcyxVyF7vpYDcIUPZlqZyec30RMy/x2/S
         xoLOk9KAKYT+hIgjsaqBZMv4kkoXPPy9HvLo5U/D3AqaYKKaXQw1JRw8J7Jybc4zG+yR
         YX9SBXDVTLchbLY2uIVXYVPT5CKIfdgc5z+NmpndEyxRbcq5vOzfPG5Nd2eUtBWtcKYh
         iUSA==
X-Forwarded-Encrypted: i=1; AKwUvBxKFXa3dQa6Qwxt/JgkOZzWBCOXwVOx7WGk71wfTXjyGxdray/GhS3p+iFxnGYSRI7d3JMeOTO/Mv/n@vger.kernel.org
X-Gm-Message-State: AFq9FYL4PMF4L/eQMQKjfquiG3+7Ol2tAjmXx2f01iC56u/XQ6RJ/zjr
	oji64ADYYDugoru3Ofmdec4ulM4uSp7VMJPo//MdQIplN9uILM2uwvWUNDSyyp3g7bMLhsAbgiv
	JZ0iqb63b+wuvmzEQ2qG9RdiiqU6iKZ9Xm5EccB/HRSyMO0yDnzE5lICVxMjFyptJyuMLVp89/6
	TxEwteJN2Rd3fyMyIveXpkEOTOw9bDfKHY8S4VukY=
X-Gm-Gg: AYBFou3Vlk8kzEeHxA9YurlRPE6/cL+nV7puNSB1b9w5aKgmu2+pZ6d+zpJUWQcvBaA
	hN8iL53yi9ntmOfcVdlIt1acCC/pCR3WNMabOQ7/ZYTKdn+nGLE/MfnbR9MbEpg7CtX9m3oRwpM
	FYHgYUdL+KVlb/LMloH1vl342JIoT99UyhpsgezQObE3F4Vo2PWlzgSthnbpMxj9i/XoDUsqxmR
	SD3LJUQ+FeGDYOJFw==
X-Received: by 2002:a17:902:e948:b0:2df:a21b:12e1 with SMTP id d9443c01a7336-2e2e4918401mr15079965ad.3.1790785679707;
        Wed, 30 Sep 2026 09:27:59 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2df:a21b:12e1 with SMTP id
 d9443c01a7336-2e2e4918401mr15079785ad.3.1790785679221; Wed, 30 Sep 2026
 09:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com> <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
In-Reply-To: <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:57:48 +0530
X-Gm-Features: AclHuK_mjB9IIz-du31WR756mfxeN7AReNTvfzYa8Zcb5OIQ5GE1Yf2pFwXiAXU
Message-ID: <CAHuiULASZ4r2DwrJYh8GrkcOFycAROsWN_1Cxnj5PsXWMVFotw@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Aq-lAxDpAANhR4DU6JU8X081ZCB4gf82
X-Proofpoint-ORIG-GUID: Aq-lAxDpAANhR4DU6JU8X081ZCB4gf82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX/ouzjVEafjkq
 XvyrSqseZfXtTzr2rZYcPGF+n5meBjCOZG01S4KYMRE2M9GFi7wCKPPpizsFdMef9or+fkhl5OF
 KUaidrW3mzCU3jS+/nm8pdj+c8vJHAOPRgIbIKn4/nfNwat/rxo0aPd9HfjPQxGoG31L/0cFneX
 VsUr5Tco9T9KHfa3N80vEP2GTB4KPinQYLwSh9aRnH0uEXi3KzCcehHzKL5Ua9/SYRKknZsVMms
 2W8loDLgkXAu5HN39dUAq6Y4YG4WzE91EFkLl6ytXJ1LvR/cDjoI+FM7+qBOdHIgHSoK9VMUo1T
 daEfDgkU8vxxqWEPqPJ2CXnsWMwZ7CrC2t+tp7HA4xh950dShdkGXOxb9I97MBrlqItaxmIbCpC
 xz9iEpdOX3WUBihHGJWwMJcVRFJf1cD1Nv+LzSKWaaTS/5jIeDRIdCubLZTaUTAUjFzTDZfwQVY
 M570iYreook2KV3yQiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX5hAwaxAdFJJS
 YvNW62UsQK9fGUQ0aNKqYWCU4TuiCkUxe+U2HOu/cgMPMi4z9KbCPURuZQhqj+MNfZFBoTxcnJU
 VyPvqa+Tsgq9YOGDEjsBwgdqbhqsHso=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd3890 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=lv0vYI88AAAA:8 a=rVxIM9veg9Z6xXw7olMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300065

On Fri, Sep 11, 2026 at 2:54=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
>
> > +static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdat=
a)
> > +{
> > +     struct device_node *parent, *ep_node, *rep_node, *rdev_node;
> > +     struct gtrace_connection *conn;
> > +     struct of_endpoint ep, rep;
> > +     int ret =3D 0, i =3D 0;
> > +
> > +     parent =3D of_get_child_by_name(dev_of_node(pdata->dev), "out-por=
ts");
> > +     if (!parent)
> > +             return 0;
> > +
> > +     pdata->nr_outconns =3D of_graph_get_endpoint_count(parent);
> > +     pdata->outconns =3D devm_kcalloc(pdata->dev, pdata->nr_outconns,
> > +                                    sizeof(*pdata->outconns), GFP_KERN=
EL);
> > +     if (!pdata->outconns) {
> > +             ret =3D -ENOMEM;
> > +             goto done;
> > +     }
> > +
> > +     for_each_endpoint_of_node(parent, ep_node) {
> > +             conn =3D devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERN=
EL);
> > +             if (!conn) {
> > +                     of_node_put(ep_node);
> > +                     ret =3D -ENOMEM;
> > +                     break;
> > +             }
> > +
> > +             ret =3D of_graph_parse_endpoint(ep_node, &ep);
> > +             if (ret) {
> > +                     of_node_put(ep_node);
> > +                     break;
> > +             }
> > +
> > +             rep_node =3D of_graph_get_remote_endpoint(ep_node);
> > +             if (!rep_node) {
> > +                     ret =3D -ENODEV;
> > +                     of_node_put(ep_node);
> > +                     break;
> > +             }
> > +             rdev_node =3D of_graph_get_port_parent(rep_node);
> > +
> > +             ret =3D of_graph_parse_endpoint(rep_node, &rep);
> > +             if (ret) {
> > +                     of_node_put(ep_node);
> > +                     of_node_put(rep_node);
> > +                     of_node_put(rdev_node);
> > +                     break;
> > +             }
> > +
> > +             conn->src_port =3D ep.port;
> > +             conn->src_fwnode =3D dev_fwnode(pdata->dev);
> > +             /* The 'src_comp' is set by gtrace_register_component() *=
/
> > +             conn->src_comp =3D NULL;
> > +             conn->dest_port =3D rep.port;
> > +             conn->dest_fwnode =3D of_fwnode_handle(rdev_node);
> > +             fwnode_handle_get(conn->dest_fwnode);
> > +             conn->dest_comp =3D gtrace_find_by_fwnode(conn->dest_fwno=
de);
> > +             if (!conn->dest_comp) {
> > +                     ret =3D -EPROBE_DEFER;
> > +                     of_node_put(ep_node);
> > +                     of_node_put(rep_node);
> > +                     of_node_put(rdev_node);
> > +                     break;
> > +             }
> > +
> > +             pdata->outconns[i] =3D conn;
> > +             i++;
> > +     }
> > +
> > +done:
> > +     if (ret) {
> > +             for (i =3D 0; i < pdata->nr_outconns && pdata->outconns; =
i++) {
> > +                     conn =3D pdata->outconns[i];
> > +                     if (conn && conn->dest_fwnode)
> > +                             fwnode_handle_put(conn->dest_fwnode);
> > +             }
> > +     }
> > +     of_node_put(parent);
> > +     return ret;
> > +}
> > +
> > +static int rvtrace_of_parse_inconns(struct gtrace_platform_data *pdata=
)
> > +{
> > +     struct device_node *parent;
> > +     int ret =3D 0;
> > +
> > +     parent =3D of_get_child_by_name(dev_of_node(pdata->dev), "in-port=
s");
> > +     if (!parent)
> > +             return 0;
> > +
> > +     pdata->nr_inconns =3D of_graph_get_endpoint_count(parent);
> > +     pdata->inconns =3D devm_kcalloc(pdata->dev, pdata->nr_inconns,
> > +                                   sizeof(*pdata->inconns), GFP_KERNEL=
);
> > +     if (!pdata->inconns)
> > +             ret =3D -ENOMEM;
> > +
> > +     of_node_put(parent);
> > +     return ret;
> > +}
>
> Hi,
>
> These functions operate solely on generic gtrace structures.They shoul
> be moved to the gtrace core as common helpers to avoid duplication.
> This is particularly important for mixed topologies where RISC-V
> trace components (e.g., ATB bridge) connect directly to CoreSight
> components (e.g., funnel, TMC).
>
Yes, I have moved them into separate file in v6.
> Regards,
> Zane
>
>
>
>
